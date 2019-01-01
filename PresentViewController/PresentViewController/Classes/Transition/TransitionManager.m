//
//  TransitionManager.m
//  PresentViewController
//
//  Created by 姚晓丙 on 2019/1/1.
//  Copyright © 2019 姚晓丙. All rights reserved.
//

#import "TransitionManager.h"
#import "CustomTransition.h"
#import "InteractiveTransition.h"
#import "SecondViewController.h"

@interface TransitionManager()
@property (nonatomic, weak) UIViewController *vc;
@end


@implementation TransitionManager

-(instancetype)initWithController:(UIViewController *)vc
{
    if (self = [super init]) {
        self.vc = vc;
    }
    return self;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    CustomTransition* animator = [[CustomTransition alloc] init];
    animator.presenting = YES;
    return animator;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    CustomTransition* animator = [[CustomTransition alloc] init];
    animator.presenting = NO;
    return animator;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    SecondViewController *vc = self.vc;
    return vc.transition;
}


@end
