//
//  InteractiveTransitionManager.m
//  PresentViewController
//
//  Created by 姚晓丙 on 2019/1/1.
//  Copyright © 2019 姚晓丙. All rights reserved.
//

#import "InteractiveTransition.h"

@interface InteractiveTransition()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer *panGesture;
@property (nonatomic, weak) UIViewController *vc;
@end


@implementation InteractiveTransition

- (instancetype)initWithController:(UIViewController *)vc
{
    if (self = [super init]) {
        self.vc = vc;
        [self prepareGestureInView:vc.view];
    }
    return self;
}

- (void)prepareGestureInView:(UIView *)view
{
    UIScreenEdgePanGestureRecognizer *pan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    pan.edges = UIRectEdgeLeft;
    [view addGestureRecognizer:pan];
}


- (void)handlePan:(UIPanGestureRecognizer *)pan
{
    
    CGPoint translation = [pan translationInView:pan.view.superview];
    CGFloat width = pan.view.frame.size.width;
    NSAssert(width > 0, @"width must not be 0");
    CGFloat progress = translation.x / width;
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
            self.inProgress = YES;
            [self.vc dismissViewControllerAnimated:YES completion:nil];
            break;
        case UIGestureRecognizerStateChanged:
            self.shouldComplete = progress > 0.5;
            [self updateInteractiveTransition:progress];
            break;
        case UIGestureRecognizerStateEnded:
            self.inProgress = NO;
            if (self.shouldComplete) {
                [self finishInteractiveTransition];
            } else {
                [self cancelInteractiveTransition];
            }
            break;
        default:
            break;
    }
}

@end

