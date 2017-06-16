//
//  PUshViewController.m
//  UIDynamicAnimatorDemo
//
//  Created by Ju Liaoyuan on 2017/5/25.
//  Copyright © 2017年 Fangzhiwei Information Technology Co., Ltd. All rights reserved.
//

#import "PushViewController.h"

@interface PushViewController ()

@property (nonatomic, strong) UIView *animationView;

@property (nonatomic, strong) UIDynamicAnimator *animator;

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self defaultConfig];
    [self createView];
}

- (void)defaultConfig {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.animationView = [UIView new];
    self.animationView.backgroundColor = [UIColor orangeColor];
    self.animationView.frame = CGRectMake(0, 0, 100, 100);
    self.animationView.center = CGPointMake(100, 300);
    [self.view addSubview:self.animationView];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}

- (void)createView {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 80, 100, 40);
    [btn setTitle:@"animate" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(animate) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)animate {
    UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:@[self.animationView] mode:UIPushBehaviorModeInstantaneous];
    push.angle = 1.35;
    push.magnitude = 0.5;
    [self.animator addBehavior:push];
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
