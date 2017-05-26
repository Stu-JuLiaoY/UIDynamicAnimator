//
//  AttachmentViewController.m
//  UIDynamicAnimatorDemo
//
//  Created by Ju Liaoyuan on 2017/5/24.
//  Copyright © 2017年 Fangzhiwei Information Technology Co., Ltd. All rights reserved.
//

#import "AttachmentViewController.h"


@implementation AttachmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    self.animationView = [UIView new];
    self.animationView.backgroundColor = [UIColor orangeColor];
    self.animationView.frame = CGRectMake(100, 200, 100, 100);
    [self.view addSubview:self.animationView];
    
    self.relyView = [UIView new];
    self.relyView.backgroundColor = [UIColor yellowColor];
    self.relyView.frame = CGRectMake(250, 200, 100, 100);
    [self.view addSubview:self.relyView];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 80, 100, 40);
    [btn setTitle:@"To Anchor" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(200, 80, 100, 60);
    [btn2 setTitle:@"To other view" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(buttonAction2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
}

- (void)buttonAction {
//    UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:self.animationView attachedToAnchor:CGPointMake(100, 300)];
    UIAttachmentBehavior *attachment = [UIAttachmentBehavior pinAttachmentWithItem:self.animationView attachedToItem:self.relyView attachmentAnchor:CGPointMake(100, 100)];
    attachment.damping = 0.3f;
    attachment.frequency = 0.8f;
    attachment.length = 100.f;
    [self.animator addBehavior:attachment];
    
    
}

- (void)buttonAction2 {
    UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:self.animationView attachedToItem:self.relyView];
    attachment.damping = 0.3f;
    attachment.frequency = 2.f;
    attachment.length = 100.f;
    [self.animator addBehavior:attachment];
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
