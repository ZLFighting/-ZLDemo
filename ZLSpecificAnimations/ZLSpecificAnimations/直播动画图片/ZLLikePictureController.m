//
//  ZLLikePictureController.m
//  ZLSpecificAnimations
//
//  Created by ZL on 2017/5/12.
//  Copyright © 2017年 ZL. All rights reserved.
//

#import "ZLLikePictureController.h"
#import "ZLLikeAnimation.h"

@interface ZLLikePictureController ()

@end

@implementation ZLLikePictureController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    [NSTimer scheduledTimerWithTimeInterval:0.25 target:self selector:@selector(showLikePictureView) userInfo:nil repeats:YES];

}

- (void)showLikePictureView {
    
    ZLLikeAnimation *heart = [[ZLLikeAnimation alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [self.view addSubview:heart];
    CGPoint fountainSource = CGPointMake(self.view.frame.size.width - 80, self.view.bounds.size.height - 30 / 2.0 - 10);
    heart.center = fountainSource;
    int count = round(random() % 12);
    [heart animatePictureInView:self.view Image:[UIImage imageNamed:[NSString stringWithFormat:@"resource.bundle/heart%d.png",count]]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
