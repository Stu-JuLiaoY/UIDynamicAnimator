//
//  GravityBehavioViewController.h
//  UIDynamicAnimatorDemo
//
//  Created by Ju Liaoyuan on 2017/5/24.
//  Copyright © 2017年 Fangzhiwei Information Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GravityViewController : UIViewController

@property (nonatomic, strong) UIView  *animationView;

@property (nonatomic, strong) UIDynamicAnimator *animator;

- (void)animate;

@end
