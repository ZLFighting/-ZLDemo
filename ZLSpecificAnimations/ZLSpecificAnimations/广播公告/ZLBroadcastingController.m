//
//  ZLBroadcastingViewController.m
//  ZLSpecificAnimations
//
//  Created by ZL on 2017/5/4.
//  Copyright © 2017年 ZL. All rights reserved.
//

#import "ZLBroadcastingController.h"

@interface ZLBroadcastingController ()

// 广播活动按钮
@property (weak, nonatomic) UIButton *activityBtn;

// 广播活动label
@property (weak, nonatomic) UILabel *activityLb;

@end

@implementation ZLBroadcastingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"广播跑马灯";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置广播视图
    [self setupBroadcastingView];
}

// 退出本控制器时 需要移除滚动条
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [self.activityBtn removeFromSuperview];
    [self.activityLb removeFromSuperview];
}

/**
 * 设置广播视图
 */
- (void)setupBroadcastingView {

    // 设置广播活动标题按钮
    UIButton *activityBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    activityBtn.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 30);
    activityBtn.backgroundColor = [UIColor clearColor];
    [activityBtn addTarget:self action:@selector(activityDetail) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:activityBtn];
    self.activityBtn = activityBtn;
    
    // 设置广播活动标题文字
    UILabel *activityLb = [[UILabel alloc] init];
    activityLb.frame = activityBtn.bounds;
    [activityLb setFont:[UIFont boldSystemFontOfSize:14]];
    [activityLb setTextColor:[UIColor colorWithRed:115/255.0 green:125/255.0 blue:134/255.0 alpha:1.0]];
    [activityLb setBackgroundColor:[UIColor clearColor]];
    [activityBtn addSubview:activityLb];
    self.activityLb = activityLb;
    
    // 设置广播logo
    UIImageView *speaker = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"broadcasting"]]];
    speaker.frame = CGRectMake(0, 5, 20, 20);
    speaker.backgroundColor = self.view.backgroundColor;
    [activityBtn addSubview:speaker];
    
    // 设置广播公告广告内容
    [self setActivityButtonTitle];
}


/**
 * 设置广播公告广告内容
 */
- (void)setActivityButtonTitle {
    
    // 广播公告广告内容(测试内容)
    NSString *title = @"广播公告广告内容(ZL测试内容)广播公告广告内容(测试内容)\r\n广播公告广告内容(测试内容)广播公告广告内容(测试内容)广播公告广告内容(测试内容)";
    
    title = [title stringByReplacingOccurrencesOfString:@"\r\n" withString:@" "];
    
    [self.activityLb setText:title];
    
    [self.activityLb sizeToFit];
    
    if (self.activityLb.frame.size.width <= self.activityBtn.frame.size.width) {
        
        [self.activityLb setCenter:CGPointMake(self.activityBtn.frame.size.width/2, self.activityBtn.frame.size.height/2)];
        
    } else { // 当文字内容超过显示区域就滚动展示
        
        CGRect frame = self.activityLb.frame;
        frame.origin.x = self.activityBtn.frame.size.width;
        frame.origin.y = self.activityBtn.frame.size.height * 0.5 - self.activityLb.bounds.size.height * 0.5;
        self.activityLb.frame = frame;
        
        [UIView beginAnimations:@"testAnimation" context:NULL];
        [UIView setAnimationDuration:frame.size.width/55.f];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [UIView setAnimationRepeatAutoreverses:NO];
        [UIView setAnimationRepeatCount:INT_MAX];
        
        frame = self.activityLb.frame;
        frame.origin.x = - frame.size.width;
        self.activityLb.frame = frame;
        [UIView commitAnimations];
    }
}

// 展示活动详情
- (void)activityDetail {
    
    NSLog(@"点击了广播活动公告详情");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
