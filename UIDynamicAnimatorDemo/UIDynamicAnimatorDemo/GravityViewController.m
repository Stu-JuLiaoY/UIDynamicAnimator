//
//  GravityBehavioViewController.m
//  UIDynamicAnimatorDemo
//
//  Created by Ju Liaoyuan on 2017/5/24.
//  Copyright © 2017年 Fangzhiwei Information Technology Co., Ltd. All rights reserved.
//

#import "GravityViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface GravityViewController ()

@end

@implementation GravityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 80, 100, 40);
    [btn setTitle:@"animate" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(animate) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.animationView = [UIView new];
    self.animationView.backgroundColor = [UIColor orangeColor];
    self.animationView.frame = CGRectMake(0, 0, 100, 100);
    self.animationView.center = CGPointMake(100, 300);
    [self.view addSubview:self.animationView];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}

- (void)animate {
    self.animationView.center = CGPointMake(100, 300);
    [self.animator removeAllBehaviors];
    
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.animationView]];
    gravity.gravityDirection = CGVectorMake(0, 1);
    gravity.magnitude = 1.f;
    [self.animator addBehavior:gravity];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
