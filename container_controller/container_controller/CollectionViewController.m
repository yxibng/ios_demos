//
//  CollectionViewController.m
//  container_controller
//
//  Created by 姚晓丙 on 2018/12/31.
//  Copyright © 2018 姚晓丙. All rights reserved.
//

#import "CollectionViewController.h"
#import "ViewController_1.h"
#import "ViewController_2.h"

@interface CollectionViewController ()

@property (nonatomic, strong) ViewController_1 *vc1;
@property (nonatomic, strong) ViewController_2 *vc2;

@property (nonatomic, strong) NSArray *vcs;

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.vc1 = [ViewController_1 new];
    self.vc2 = [ViewController_2 new];
    
    NSMutableArray *vcs = @[].mutableCopy;
    [vcs addObjectsFromArray:@[_vc1, _vc2]];
    
    NSLock *lock = [[NSLock alloc] init];
    
    dispatch_apply(5, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t index) {
        [lock lock];
        UIViewController *vc = [UIViewController new];
        vc.navigationItem.title = [NSString stringWithFormat:@"%lu", index+2];
        [vcs addObject:vc];
        [lock unlock];
    });
    self.vcs = vcs;
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    // Do any additional setup after loading the view.
    self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
    self.collectionView.allowsSelection = NO;
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.vcs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = self.vcs[indexPath.item];
    
    [vc beginAppearanceTransition:YES animated:YES];
    [self addChildViewController:vc];
    vc.view.backgroundColor = [self randomColor];
    [cell.contentView addSubview:vc.view];
    vc.view.frame = cell.contentView.frame;
    [vc didMoveToParentViewController:self];
    
    [vc endAppearanceTransition];
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UIViewController *vc = self.vcs[indexPath.item];
    [vc beginAppearanceTransition:NO animated:YES];
    [vc willMoveToParentViewController:nil];
    [vc.view removeFromSuperview];
    [vc removeFromParentViewController];
    
    [vc endAppearanceTransition];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return collectionView.frame.size;
}

//For top/bottom/left/right padding method
- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *) collectionView layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger) section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
    return NO;
}

- (UIViewController *)childViewControllerForStatusBarStyle
{
    return self.vc1;
}

- (UIViewController *)childViewControllerForStatusBarHidden
{
    return self.vc1;
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}


- (UIColor *)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    return color;
}


@end
