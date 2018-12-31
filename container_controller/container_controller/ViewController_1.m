//
//  ViewController_1.m
//  container_controller
//
//  Created by 姚晓丙 on 2018/12/31.
//  Copyright © 2018 姚晓丙. All rights reserved.
//

#import "ViewController_1.h"

@interface ViewController_1 ()

@end

@implementation ViewController_1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn setTitle:@"click" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    // Do any additional setup after loading the view.
}


- (void)click
{
    [self setNeedsStatusBarAppearanceUpdate];

}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"%s",__func__);
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"%s",__func__);
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"%s",__func__);

}


- (BOOL)prefersStatusBarHidden
{
    return YES;
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
