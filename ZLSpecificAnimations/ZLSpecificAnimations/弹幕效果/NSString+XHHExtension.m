//
//  NSString+XHHExtension.m
//  ZLSpecificAnimations
//
//  Created by ZL on 2017/5/4.
//  Copyright © 2017年 ZL. All rights reserved.
//

#import "NSString+XHHExtension.h"

@implementation NSString (XHHExtension)

- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW {
    
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font {
    
    return [self sizeWithFont:font maxW:MAXFLOAT];
}

- (CGFloat)widthWithStringAttribute:(NSDictionary <NSString *, id> *)attribute {
    
    NSParameterAssert(attribute);
    
    CGFloat width = 0;
    
    if (self.length) {
        
        CGRect rect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, 0)
                                         options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin |
                       NSStringDrawingUsesFontLeading
                                      attributes:attribute
                                         context:nil];
        
        width = rect.size.width;
    }
    
    return width;
}

@end
