//
//  InteractiveTransitionManager.h
//  PresentViewController
//
//  Created by 姚晓丙 on 2019/1/1.
//  Copyright © 2019 姚晓丙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) BOOL inProgress;
@property (nonatomic, assign) BOOL shouldComplete;

- (instancetype)initWithController:(UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
