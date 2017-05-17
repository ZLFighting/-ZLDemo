//
//  ZLBarrageController.m
//  ZLSpecificAnimations
//
//  Created by ZL on 2017/5/4.
//  Copyright © 2017年 ZL. All rights reserved.
//

#import "ZLBarrageController.h"
#import "ZLScrollLabelView.h"
#import "NSString+XHHExtension.h"


@interface ZLBarrageController () <ZLScrollLabelViewDelegate>

@property (nonatomic, strong) UILabel *label;

@end

@implementation ZLBarrageController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"弹幕动画";
    self.view.backgroundColor = [UIColor grayColor];
    
    ZLScrollLabelView *barrageView0 = [[ZLScrollLabelView alloc] initWithFrame:CGRectMake(0, 104, self.view.frame.size.width, 20)];
//    ZLScrollLabelView *barrageView1 = [[ZLScrollLabelView alloc] initWithFrame:CGRectMake(0, 124, self.view.frame.size.width, 20)];
//    ZLScrollLabelView *barrageView2 = [[ZLScrollLabelView alloc] initWithFrame:CGRectMake(0, 144, self.view.frame.size.width, 20)];
//    ZLScrollLabelView *barrageView3 = [[ZLScrollLabelView alloc] initWithFrame:CGRectMake(0, 164, self.view.frame.size.width, 20)];

    barrageView0.delegate = self;
//    barrageView1.delegate = self;
//    barrageView2.delegate = self;
//    barrageView3.delegate = self;
    
    // add
    [self.view addSubview:barrageView0];
//    [self.view addSubview:barrageView1];
//    [self.view addSubview:barrageView2];
//    [self.view addSubview:barrageView3];
    
    // text
    [barrageView0 addContentView:[self createLabelWithText:@"超喜欢赵丽颖,只因她的踏实!"
                                                     textColor:[self randomColor]]];
//    [barrageView1 addContentView:[self createLabelWithText:@"赵小刀,小骨,骨头~"
//                                                     textColor:[self randomColor]]];
//    [barrageView2 addContentView:[self createLabelWithText:@"ZL是个iOS开发者"
//                                                     textColor:[self randomColor]]];
//    [barrageView3 addContentView:[self createLabelWithText:@"喜欢分享!"
//                                                     textColor:[self randomColor]]];
    
    // start
    [barrageView0 startAnimation];
//    [barrageView1 startAnimation];
//    [barrageView2 startAnimation];
//    [barrageView3 startAnimation];
    
}

#pragma mark -
- (UILabel *)createLabelWithText:(NSString *)text textColor:(UIColor *)textColor {
    
    NSString *string = [NSString stringWithFormat:@" %@ ", text];
    CGFloat width = [string widthWithStringAttribute:@{NSFontAttributeName : [UIFont systemFontOfSize:14.f]}];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 20)];
    label.font = [UIFont systemFontOfSize:14.f];
    label.text = string;
    label.textColor = textColor;
    return label;
}

#pragma mark - ZLScrollLabelViewDelegate

- (void)barrageView:(ZLScrollLabelView *)barrageView animationDidStopFinished:(BOOL)finished {
    
    [barrageView stopAnimation];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [barrageView addContentView:[self createLabelWithText:[self randomString]
                                                        textColor:[self randomColor]]];
        [barrageView startAnimation];
    });
}

- (NSString *)randomString {
    
    NSArray *array = @[@"猜猜我是谁?",
                       @"哈哈😁",
                       @"猜不着吧",
                       @"我是程序媛",
                       @"噜啦啦啦啦~"];
    return array[arc4random() % array.count];
}

#pragma mark - 产生随机色

- (UIColor *)randomColor {
    
    return [UIColor colorWithRed:arc4random() % 256 / 255.f green:arc4random() % 256 / 255.f blue:arc4random() % 256 / 255.f alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
