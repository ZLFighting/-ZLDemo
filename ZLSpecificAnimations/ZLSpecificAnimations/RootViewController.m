//
//  RootViewController.m
//  ZLSpecificAnimations
//
//  Created by ZL on 2017/5/4.
//  Copyright © 2017年 ZL. All rights reserved.
//

#import "RootViewController.h"
#import "ZLBroadcastingController.h"
#import "ZLBarrageController.h"
#import "ZLFireworksController.h"
#import "ZLSnowflakeController.h"
#import "ZLLiveHeartController.h"
#import "ZLLikePictureController.h"


#define cellId @"cell"

@interface RootViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *titleNames;

@property (nonatomic, strong) NSMutableArray *classNames;

@end

@implementation RootViewController

#pragma mark - 懒加载

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 50;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier: cellId];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"特效动画";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.classNames = @[].mutableCopy;
    self.titleNames = @[].mutableCopy;

    [self addCell:@"广播跑马灯" class:@"ZLBroadcastingController"];
    [self addCell:@"弹幕动画" class:@"ZLBarrageController"];
    [self addCell:@"直播点赞动画" class:@"ZLLiveHeartController"];
    [self addCell:@"直播点赞图片动画" class:@"ZLLikePictureController"];
    [self addCell:@"烟花动画" class:@"ZLFireworksController"];
    [self addCell:@"雪花动画" class:@"ZLSnowflakeController"];
    
    
    [self.view addSubview:self.tableView];

    [self.tableView reloadData];
}

#pragma mark - 创建表格数据源

- (void)addCell:(NSString *)title class:(NSString *)className {
    
    [self.classNames addObject:className];
    [self.titleNames addObject:title];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.classNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld - %@", (long)indexPath.row, self.titleNames[indexPath.row]];
    return cell;
}

#pragma mark -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *className = self.classNames[indexPath.row];
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *vc = class.new;
        vc.title = self.titleNames[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
