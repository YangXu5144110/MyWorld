//
//  YXCircleDetailsViewController.m
//  MyWorld
//
//  Created by 杨旭 on 2017/12/1.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXCircleDetailsViewController.h"
#import "YXCircleDynamicCell.h"
@interface YXCircleDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@end

@implementation YXCircleDetailsViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64- 50)) style:(UITableViewStylePlain)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[YXCircleDynamicCell class] forCellReuseIdentifier:@"YXCircleDynamicCell"];
        [_tableView registerClass:[YXCircleDynamicCell1 class] forCellReuseIdentifier:@"YXCircleDynamicCell1"];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createLeftBarButtonItemWithImage:@"huiyuan-return"];
    self.title = @"详情";
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else {
        return 3;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        YXCircleDynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YXCircleDynamicCell" forIndexPath:indexPath];
        return cell;
    }else {
        YXCircleDynamicCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"YXCircleDynamicCell1" forIndexPath:indexPath];
        return cell;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.section == 0 ? 325 : 120;
    
}


@end
