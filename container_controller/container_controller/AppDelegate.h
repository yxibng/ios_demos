//
//  AppDelegate.h
//  container_controller
//
//  Created by 姚晓丙 on 2018/12/31.
//  Copyright © 2018 姚晓丙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

