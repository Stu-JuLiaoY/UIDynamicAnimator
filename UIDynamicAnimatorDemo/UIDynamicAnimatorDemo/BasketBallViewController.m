//
//  BasketBallViewController.m
//  UIDynamicAnimatorDemo
//
//  Created by Ju Liaoyuan on 2017/5/25.
//  Copyright © 2017年 Fangzhiwei Information Technology Co., Ltd. All rights reserved.
//

#import "BasketBallViewController.h"

@interface BasketBallViewController ()

@property (nonatomic, strong) UIImageView *ball;

@property (nonatomic, strong) UIDynamicAnimator *animator;

@property (nonatomic, strong) UIView *floor;

@end

@implementation BasketBallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:179/255.0 green:216/255.0 blue:247/255.0 alpha:1];
    
    [self.view addSubview:self.ball];
    [self.view addSubview:self.floor];

    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bat)];
    [self.ball addGestureRecognizer:tap];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self setupAnimation];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.animator removeAllBehaviors];
}

- (void)setupAnimation {
    
    [self.animator removeAllBehaviors];
    
    UICollisionBehavior *collsion = [[UICollisionBehavior alloc] initWithItems:@[self.ball,self.floor]];
    collsion.collisionMode = UICollisionBehaviorModeEverything;
    
//    collsion.translatesReferenceBoundsIntoBoundary = YES;
    
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.ball]];
    
    UIDynamicItemBehavior *custom = [[UIDynamicItemBehavior alloc] initWithItems:@[self.ball]];
    custom.elasticity = 1.f;
    custom.density = 3;
    custom.action = ^{
        if (!CGRectIntersectsRect(self.ball.frame, self.view.frame)) {
            NSLog(@"111");
            [self setupAnimation];
            self.ball.frame = CGRectMake(50, CGRectGetHeight(self.view.frame) - 150, 50, 50);
        }
    };
    
    
    
    UIDynamicItemBehavior *floorItem = [[UIDynamicItemBehavior alloc] initWithItems:@[self.floor]];
    floorItem.anchored = YES;
    
    [self.animator addBehavior:collsion];
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:custom];
    [self.animator addBehavior:floorItem];
}

- (void)bat {
    UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:@[self.ball] mode:UIPushBehaviorModeInstantaneous];
    push.angle = -1.35;
    push.magnitude = 8.f;
    [self.animator addBehavior:push];
}

- (UIImageView *)ball {
    if (!_ball) {
        _ball = [[UIImageView alloc] initWithFrame:CGRectMake(50, CGRectGetHeight(self.view.frame) - 150, 50, 50)];
        _ball.backgroundColor = UIColor.redColor;
        _ball.layer.cornerRadius = 25.f;
        _ball.layer.masksToBounds = YES;
        _ball.userInteractionEnabled = YES;

    }
    return _ball;
}

- (UIView *)floor {
    if (!_floor) {
        _floor = [UIView new];
        _floor.frame = CGRectMake(0, self.view.frame.size.height - 40, self.view.frame.size.width, 40);
        _floor.backgroundColor = [UIColor colorWithRed:229/255.0 green:72/255.0 blue:74/255.0 alpha:1];
    }
    return _floor;
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
