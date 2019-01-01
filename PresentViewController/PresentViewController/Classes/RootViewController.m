//
//  RootViewController.m
//  PresentViewController
//
//  Created by 姚晓丙 on 2019/1/1.
//  Copyright © 2019 姚晓丙. All rights reserved.
//

#import "RootViewController.h"
#import "SecondViewController.h"
#import "PopoverViewController.h"
#import "TransitionManager.h"

@interface RootViewController ()<UIPopoverPresentationControllerDelegate>

@property (nonatomic, strong) TransitionManager *manager;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"RootController";
    UIBarButtonItem *popoverItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(popoverViewController:)];
    
    [self.navigationItem setRightBarButtonItem:popoverItem];
    // Do any additional setup after loading the view.
}

- (void)popoverViewController:(UIBarButtonItem *)sender
{
    PopoverViewController *vc = [PopoverViewController new];
    vc.modalPresentationStyle = UIModalPresentationPopover;
    vc.preferredContentSize = CGSizeMake(100, 100);
    vc.popoverPresentationController.barButtonItem = sender;
    
    
    UIPopoverPresentationController *popoverVC = vc.popoverPresentationController;
    popoverVC.backgroundColor = [UIColor greenColor];
    popoverVC.delegate = self;
    popoverVC.barButtonItem = sender;
    popoverVC.permittedArrowDirections = UIPopoverArrowDirectionAny;
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - UIPopoverPresentationControllerDelegate
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}


- (IBAction)presentViewController:(id)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SecondViewController *vc = [sb instantiateViewControllerWithIdentifier:@"SecondViewController"];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    //    vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    //    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    //    vc.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:nil];
}
- (IBAction)presentWithCustomTransition:(id)sender {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SecondViewController *vc = [sb instantiateViewControllerWithIdentifier:@"SecondViewController"];
    if (!self.manager) {
        self.manager = [[TransitionManager alloc] initWithController:vc];
    }
    vc.transitioningDelegate = self.manager;
    [self presentViewController:vc animated:YES completion:nil];
    
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
