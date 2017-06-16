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
    self.animationView.frame = CGRectMake(0, 0, 100, 100);
    self.animationView.center = CGPointMake(100, 100);
    [self.view addSubview:self.animationView];
    
    self.relyView = [UIView new];
    self.relyView.backgroundColor = [UIColor yellowColor];
    self.relyView.frame = CGRectMake(250, 200, 100, 100);
    [self.view addSubview:self.relyView];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 80, 100, 40);
    [btn setTitle:@"leftAction" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(200, 80, 150, 40);
    [btn2 setTitle:@"rightAction" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    self.attachment = [[UIAttachmentBehavior alloc] initWithItem:self.animationView attachedToAnchor:CGPointMake(200, 200)];
    self.attachment.damping = 0.3f;
    self.attachment.frequency = 5.f;
    [self.animator addBehavior:self.attachment];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureAction:)];
    [self.view addGestureRecognizer:pan];
    
}


- (void)panGestureAction:(UIPanGestureRecognizer *)panGesture {
    
    if (panGesture.state == UIGestureRecognizerStateBegan) {
        [self.animator removeAllBehaviors];
        [self.animator addBehavior:self.attachment];
    }
    if (panGesture.state == UIGestureRecognizerStateChanged) {
        CGPoint touchPoint = [panGesture locationInView:self.view];
        self.attachment.anchorPoint = touchPoint;
    }
}

- (void)leftAction {
    [self.animator removeAllBehaviors];
    self.animationView.frame = CGRectMake(100, 200, 100, 100);
    
    UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:self.animationView attachedToAnchor:CGPointMake(100, 500)];
    attachment.damping = 0.3f;
    attachment.frequency = 0.8f;
    attachment.length = 100.f;
    
    [self.animator addBehavior:attachment];
}

- (void)rightAction {
    
    [self.animator removeAllBehaviors];
    self.animationView.frame = CGRectMake(100, 200, 100, 100);
    self.relyView.frame = CGRectMake(250, 200, 100, 100);
    [self.view layoutIfNeeded];
    
    UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:self.animationView attachedToItem:self.relyView];
//    UIAttachmentBehavior *attachment = [UIAttachmentBehavior pinAttachmentWithItem:self.animationView attachedToItem:self.relyView attachmentAnchor:CGPointMake(1000, 1000)];
    
    attachment.damping = 0.5;
    attachment.frequency = 1.f;
    attachment.length = 80;
    attachment.action = ^{
        NSLog(@"%@",NSStringFromCGRect(self.animationView.frame));
    };
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
