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

- (void)buttonAction {
    [super buttonAction];
    
    UIDynamicItemBehavior *item = [[UIDynamicItemBehavior alloc] initWithItems:@[self.animationView]];
    // 弹力
    item.elasticity = 0.7;
    // 摩擦力
    item.friction = 0.0;
    // 密度
    item.density = 1.f;
    item.charge = 1.f;
//    item.anchored = YES;
    // 阻力
//    item.resistance = 0.f;
    // 角距离
    item.angularResistance = 10.f;
    [item addAngularVelocity:1 forItem:self.animationView]; // 让物体旋转
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
