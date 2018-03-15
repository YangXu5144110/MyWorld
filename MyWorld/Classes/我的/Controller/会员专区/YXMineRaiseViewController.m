//
//  YXMineRaiseViewController.m
//  MyWorld
//
//  Created by 杨旭 on 2017/12/1.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXMineRaiseViewController.h"
#import "YXRaiseHeaderView.h"
#import "YXRaiseTableView.h"
#import "YXMineRaiseDetailsViewController.h"
@interface YXMineRaiseViewController ()

@property (nonatomic ,strong) YXRaiseHeaderView *headerView;
@property (nonatomic ,strong) YXRaiseTableView *tableView;
@end

@implementation YXMineRaiseViewController

- (YXRaiseHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[YXRaiseHeaderView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 100))];
    }
    return _headerView;
}

- (YXRaiseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[YXRaiseTableView alloc] initWithFrame:(CGRectMake(0, 100, kScreenWidth, kScreenHeight-100 -64)) style:(UITableViewStylePlain)];
        YXWeakSelf
        [_tableView setDidSelectRowAtIndexPath:^(NSInteger index) {
            YXMineRaiseDetailsViewController *detailsVC = [[YXMineRaiseDetailsViewController alloc] init];
            [weakSelf.navigationController pushViewController:detailsVC animated:YES];
        }];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"众筹";
    [self createLeftBarButtonItemWithImage:@"huiyuan-return"];
    
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.tableView];
}


@end
