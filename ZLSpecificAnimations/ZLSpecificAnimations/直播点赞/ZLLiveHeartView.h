//
//  ZLLiveHeartView.h
//  ZLSpecificAnimations
//
//  Created by ZL on 2017/5/5.
//  Copyright © 2017年 ZL. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBAColor(r, g, b ,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define RandColor RGBColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

@interface ZLLiveHeartView : UIView

- (void)liveHeartAnimateInView:(UIView *)view;

@end
