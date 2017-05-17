//
//  ZLScrollLabelView.m
//  ZLSpecificAnimations
//
//  Created by ZL on 2017/5/4.
//  Copyright © 2017年 ZL. All rights reserved.
//

#import "ZLScrollLabelView.h"

@interface ZLScrollLabelView () {
    CGFloat _width;
    CGFloat _height;
    
    CGFloat _animationViewWidth;
    CGFloat _animationViewHeight;
    
    BOOL _stoped;
    UIView *_contentView;
}

@property (nonatomic, strong) UIView *animationView;

@end

@implementation ZLScrollLabelView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        _width = frame.size.width;
        _height = frame.size.height;
        
        self.speed = 1.f;
        self.barrageDirection = FromLeftType;
        self.layer.masksToBounds = YES;
        self.animationView = [[UIView alloc] initWithFrame:CGRectMake(_width, 0, _width, _height)];
        [self addSubview:self.animationView];
    }
    
    return self;
}

- (void)addContentView:(UIView *)view {
    
    [_contentView removeFromSuperview];
    
    view.frame = view.bounds;
    _contentView = view;
    self.animationView.frame = view.bounds;
    [self.animationView addSubview:_contentView];
    
    _animationViewWidth = self.animationView.frame.size.width;
    _animationViewHeight = self.animationView.frame.size.height;
}

// 开始
- (void)startAnimation {
    
    [self.animationView.layer removeAnimationForKey:@"animationViewPosition"];
    _stoped = NO;
    
    CGPoint pointRightCenter = CGPointMake(_width + _animationViewWidth / 2.f, _animationViewHeight / 2.f);
    CGPoint pointLeftCenter  = CGPointMake(-_animationViewWidth / 2, _animationViewHeight / 2.f);
    CGPoint fromPoint = self.barrageDirection == FromLeftType ? pointRightCenter : pointLeftCenter;
    CGPoint toPoint = self.barrageDirection == FromLeftType ? pointLeftCenter  : pointRightCenter;
    
    self.animationView.center = fromPoint;
    UIBezierPath *movePath = [UIBezierPath bezierPath];
    [movePath moveToPoint:fromPoint];
    [movePath addLineToPoint:toPoint];
    
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnimation.path = movePath.CGPath;
    moveAnimation.removedOnCompletion = YES;
    moveAnimation.duration = _animationViewWidth / 30.f * (1 / self.speed);
    moveAnimation.delegate = self;
    [self.animationView.layer addAnimation:moveAnimation forKey:@"animationViewPosition"];
}

// 停止
- (void)stopAnimation {
    
    _stoped = YES;
    [self.animationView.layer removeAnimationForKey:@"animationViewPosition"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(barrageView:animationDidStopFinished:)]) {
        
        [self.delegate barrageView:self animationDidStopFinished:flag];
    }
    
    if (flag && !_stoped) {
        
        [self startAnimation];
    }
}

// 暂停
- (void)pauseAnimation {
    
    [self pauseLayer:self.animationView.layer];
}

// 恢复
- (void)resumeAnimation {
    
    [self resumeLayer:self.animationView.layer];
}

- (void)pauseLayer:(CALayer*)layer {
    
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

- (void)resumeLayer:(CALayer*)layer {
    
    CFTimeInterval pausedTime = layer.timeOffset;
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}

@end
