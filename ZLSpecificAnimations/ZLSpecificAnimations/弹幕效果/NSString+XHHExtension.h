//
//  NSString+XHHExtension.h
//  ZLSpecificAnimations
//
//  Created by ZL on 2017/5/4.
//  Copyright © 2017年 ZL. All rights reserved.
//  根据传入的内容来改变文字宽度

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (XHHExtension)

- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;

- (CGSize)sizeWithFont:(UIFont *)font;

- (CGFloat)widthWithStringAttribute:(NSDictionary <NSString *, id> *)attribute;

@end
