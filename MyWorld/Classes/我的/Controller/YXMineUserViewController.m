//
//  YXMineUserViewController.m
//  MyWorld
//
//  Created by 杨旭 on 2017/12/4.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXMineUserViewController.h"
#import "YXUserDataTableView.h"
#import "YXUserDataHeaderView.h"
#import "YXMineSettingViewController.h"
@interface YXMineUserViewController ()
@property (nonatomic ,strong) YXUserDataTableView *tableView;
@property (nonatomic ,strong) YXUserDataHeaderView *headerView;
@end

@implementation YXMineUserViewController

- (YXUserDataHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[YXUserDataHeaderView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 300))];
    }
    return _headerView;
}
- (YXUserDataTableView *)tableView {
    if (!_tableView) {
        _tableView = [[YXUserDataTableView alloc] initWithFrame:(CGRectMake(0, -64, kScreenWidth, kScreenHeight)) style:(UITableViewStylePlain)];
        _tableView.tableHeaderView = self.headerView;
    }
    return _tableView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //进入当前页面使导航变透明
    self.navigationController.navigationBar.translucent=YES;
    //1.1.1 在具有导航栏的viewController中设置导航栏透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:0];
    //这一个方法是将导航栏与主view之间的那个阴影线消除，将导航栏和view无缝连接
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewDidAppear:animated];
    //进入当前页面使导航变透明
    self.navigationController.navigationBar.translucent=NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"tongxun-bg"] forBarMetrics:0];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"个人资料";
    [self createNarUI];
    [self.view addSubview:self.tableView];
}

- (void)createNarUI {
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"quanquan-return"] style:(UIBarButtonItemStylePlain) target:self action:@selector(leftAction:)];
    leftItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[self getSettingBtnRightItem]];
}

- (void)leftAction:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIButton *)getSettingBtnRightItem {
    UIButton *settingBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    settingBtn.frame = CGRectMake(0, 0, 40, 30);
    [settingBtn setImage:[UIImage imageNamed:@"huiyuan-sett"] forState:(UIControlStateNormal)];
    [settingBtn addTarget:self action:@selector(settingBtnAction) forControlEvents:(UIControlEventTouchUpInside)];
    return settingBtn;
}
- (void)settingBtnAction {
    YXMineSettingViewController *settingVC = [[YXMineSettingViewController alloc] init];
    [self.navigationController pushViewController:settingVC animated:YES];
}

@end
