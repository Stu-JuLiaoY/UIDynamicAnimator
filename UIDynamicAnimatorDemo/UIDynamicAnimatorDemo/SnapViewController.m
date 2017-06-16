//
//  SnapViewController.m
//  UIDynamicAnimatorDemo
//
//  Created by Ju Liaoyuan on 2017/5/25.
//  Copyright © 2017年 Fangzhiwei Information Technology Co., Ltd. All rights reserved.
//

#import "SnapViewController.h"

@interface SnapViewController ()

@property (nonatomic, strong) UIView *animationView;

@property (nonatomic, strong) UIDynamicAnimator *animator;

@property (nonatomic, strong) UISnapBehavior *snap;

@end

@implementation SnapViewController

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
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    [self.view addGestureRecognizer:tap];
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
    [self.animator removeAllBehaviors];
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.animationView snapToPoint:CGPointMake(200, 200)];
    snap.damping = 0.5f;
    [self.animator addBehavior:snap];
    self.snap = snap;
}

- (void)tapGesture:(UITapGestureRecognizer *)tap {
    
    self.snap.snapPoint = [tap locationInView:self.view];
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
