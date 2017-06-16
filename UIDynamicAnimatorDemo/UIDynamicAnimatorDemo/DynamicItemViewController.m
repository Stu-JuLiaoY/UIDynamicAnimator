//
//  DynamicItemViewController.m
//  UIDynamicAnimatorDemo
//
//  Created by Ju Liaoyuan on 2017/5/24.
//  Copyright © 2017年 Fangzhiwei Information Technology Co., Ltd. All rights reserved.
//

#import "DynamicItemViewController.h"

@interface DynamicItemViewController ()

@end

@implementation DynamicItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)animate {
    [super animate];
    
    // 移除重力的影响
//    [self.animator removeAllBehaviors];
    
    UIDynamicItemBehavior *item = [[UIDynamicItemBehavior alloc] initWithItems:@[self.animationView]];
    // 弹力
    item.elasticity = 1.0;
    // 摩擦力
    item.friction = 0.0;
    // 密度
    item.density = 1.f;
    
//    item.charge = 1.f;
//    item.anchored = YES;
    // 阻力
    item.resistance = 1.f;
//    [item addAngularVelocity:1 forItem:self.animationView]; // 增加角速度
    [item addLinearVelocity:CGPointMake(100, 200) forItem:self.animationView]; // 增加线速度，x: 横向距离，y: 纵向距离
    item.allowsRotation = NO;
    
//    item.angularResistance = 0;

    [self.animator addBehavior:item];
    
    
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
