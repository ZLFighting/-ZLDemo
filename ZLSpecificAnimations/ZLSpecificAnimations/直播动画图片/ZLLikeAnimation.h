//
//  ZLLikeAnimation.h
//  ZLSpecificAnimations
//
//  Created by ZL on 2017/5/12.
//  Copyright © 2017年 ZL. All rights reserved.
//  点赞动画

#import <UIKit/UIKit.h>

@interface ZLLikeAnimation : UIView

@property (nonatomic, strong) UIImageView *imageView;

- (void)animatePictureInView:(UIView *)view Image:(UIImage *)image;

@end
