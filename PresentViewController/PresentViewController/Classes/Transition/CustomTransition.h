//
//  CustomTransition.h
//  PresentViewController
//
//  Created by 姚晓丙 on 2019/1/1.
//  Copyright © 2019 姚晓丙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CustomTransition : NSObject<UIViewControllerAnimatedTransitioning>
@property (nonatomic, assign) BOOL presenting;
@end

NS_ASSUME_NONNULL_END
