//
//  YXMineSettingViewController.m
//  MyWorld
//
//  Created by 杨旭 on 2017/11/27.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXMineSettingViewController.h"
#import "YXSettingTableView.h"
#import "YXMineSettingTypeViewController.h"
@interface YXMineSettingViewController ()
@property (nonatomic ,strong) YXSettingTableView *tableView;
@end

@implementation YXMineSettingViewController

- (YXSettingTableView *)tableView {
    if (!_tableView) {
        _tableView = [[YXSettingTableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
        
        YXWeakSelf
        [_tableView setDidSelectRowAtIndexPath:^(NSInteger index,NSString *title) {
            NSLog(@"%ld",index);
            YXMineSettingTypeViewController *typeVC = [[YXMineSettingTypeViewController alloc] init];
            typeVC.typeView = index;
            typeVC.title = title;
            [weakSelf.navigationController pushViewController:typeVC animated:YES];
        }];
        
        // 退出登录
        [_tableView setExitBtnClickBlock:^{
            
        }];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"设置";
    [self createLeftBarButtonItemWithImage:@"huiyuan-return"];
    [self.view addSubview:self.tableView];
}


@end
