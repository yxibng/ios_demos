//
//  SecondViewController.m
//  PresentViewController
//
//  Created by 姚晓丙 on 2019/1/1.
//  Copyright © 2019 姚晓丙. All rights reserved.
//

#import "SecondViewController.h"


@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.transition = [[InteractiveTransition alloc] initWithController:self];
}

- (IBAction)dismissViewController:(id)sender {
 
    [self dismissViewControllerAnimated:YES completion:nil];
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
