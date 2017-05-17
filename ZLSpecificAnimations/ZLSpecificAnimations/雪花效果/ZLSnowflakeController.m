//
//  ZLSnowflakeController.m
//  ZLSpecificAnimations
//
//  Created by ZL on 2017/5/5.
//  Copyright © 2017年 ZL. All rights reserved.
//

#import "ZLSnowflakeController.h"

@interface ZLSnowflakeController ()

@property (nonatomic, strong) CALayer *layer;

@end

@implementation ZLSnowflakeController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];
    
    [self setupSnowflake];
}

/**
 * 设置雪花
 */
- (void)setupSnowflake {
    
    // 创建粒子Layer
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    
    // 粒子发射位置
    snowEmitter.emitterPosition = CGPointMake(120,0);
    
    // 发射源的尺寸大小
    snowEmitter.emitterSize = self.view.bounds.size;
    
    // 发射模式
    snowEmitter.emitterMode = kCAEmitterLayerSurface;
    
    // 发射源的形状
    snowEmitter.emitterShape = kCAEmitterLayerLine;
    
    // 创建雪花类型的粒子
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    
    // 粒子的名字
    snowflake.name = @"snow";
    
    // 粒子参数的速度乘数因子
    snowflake.birthRate = 20.0;
    snowflake.lifetime = 120.0;
    
    // 粒子速度
    snowflake.velocity = 10.0;
    
    // 粒子的速度范围
    snowflake.velocityRange = 10;
    
    // 粒子y方向的加速度分量
    snowflake.yAcceleration = 2;
    
    // 周围发射角度
    snowflake.emissionRange = 0.5 * M_PI;
    
    // 子旋转角度范围
    snowflake.spinRange = 0.25 * M_PI;
    snowflake.contents  = (id)[[UIImage imageNamed:@"snow"] CGImage];
    
    // 设置雪花形状的粒子的颜色
    snowflake.color = [[UIColor whiteColor] CGColor];
    snowflake.redRange = 1.5f;
    snowflake.greenRange = 2.2f;
    snowflake.blueRange = 2.2f;
    
    snowflake.scaleRange = 0.6f;
    snowflake.scale = 0.7f;
    
    snowEmitter.shadowOpacity = 1.0;
    snowEmitter.shadowRadius = 0.0;
    snowEmitter.shadowOffset = CGSizeMake(0.0, 0.0);
    
    // 粒子边缘的颜色
    snowEmitter.shadowColor = [[UIColor whiteColor] CGColor];
    
    // 添加粒子
    snowEmitter.emitterCells = @[snowflake];
    
    // 将粒子Layer添加进图层中
    [self.view.layer addSublayer:snowEmitter];
    
    // 形成遮罩
    UIImage *image = [UIImage imageNamed:@"alpha"];
    _layer = [CALayer layer];
    _layer.frame = (CGRect){CGPointZero, self.view.bounds.size};
    _layer.contents = (__bridge id)(image.CGImage);
    _layer.position = self.view.center;
    snowEmitter.mask = _layer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
