//
//  ZLScrollLabelView.h
//  ZLSpecificAnimations
//
//  Created by ZL on 2017/5/4.
//  Copyright © 2017年 ZL. All rights reserved.
//  弹幕标签View

#import <UIKit/UIKit.h>
@class ZLScrollLabelView;

typedef NS_ENUM(NSInteger, ScrollDirectionType) {
    FromLeftType = 0,
    FromRightType = 1
};

@protocol ZLScrollLabelViewDelegate <NSObject>

// 可选择的
@optional

- (void)barrageView:(ZLScrollLabelView *)barrageView animationDidStopFinished:(BOOL)finished;

@end

@interface ZLScrollLabelView : UIView

// 代理协议
@property (nonatomic, weak) id <ZLScrollLabelViewDelegate> delegate;

// 速度
@property (nonatomic) CGFloat speed;

// 方向
@property (nonatomic) ScrollDirectionType barrageDirection;

// 容器
- (void)addContentView:(UIView *)view;

// 开始
- (void)startAnimation;

// 停止
- (void)stopAnimation;

// 暂停
- (void)pauseAnimation;

// 恢复
- (void)resumeAnimation;

@end
