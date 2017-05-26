//
//  AttachmentViewController.h
//  UIDynamicAnimatorDemo
//
//  Created by Ju Liaoyuan on 2017/5/24.
//  Copyright © 2017年 Fangzhiwei Information Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AttachmentViewController : UIViewController

@property (nonatomic, strong) UIDynamicAnimator *animator;

@property (nonatomic, strong) UIAttachmentBehavior *attachment;

@property (nonatomic, strong) UIView  *animationView;

@property (nonatomic, strong) UIView *relyView;

- (void)buttonAction;

@end
