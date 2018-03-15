//
//  YXMineViewController.m
//  MyWorld
//
//  Created by 杨旭 on 2017/11/21.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXMineViewController.h"
#import "YXMineUserPublicCell.h"
#import "YXMineRankingView.h"
#import "YXMineRankingViewCell.h"
#import "YXMineSettingViewController.h"
#import "YXMineRaiseViewController.h"
#import "YXMineUserViewController.h"
@interface YXMineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) YXMineRankingView *rankingView;
@end

@implementation YXMineViewController


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - kTabBarHeight)) style:(UITableViewStylePlain)];
        _tableView.backgroundColor = color_backColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[YXMineUserPublicCell class] forCellReuseIdentifier:@"YXMineUserPublicCell"];
        [_tableView registerClass:[YXMineRankingViewCell class] forCellReuseIdentifier:@"YXMineRankingViewCell"];
}
    return _tableView;
}

- (YXMineRankingView *)rankingView {
    if (!_rankingView) {
        _rankingView = [[YXMineRankingView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 210)) withDataArray:nil];
    }
    return _rankingView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"会员中心";

    [self createNarUI];
    [self.view addSubview:self.tableView];
}
- (void)createNarUI {
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"huiyuan-sett"] style:(UIBarButtonItemStyleDone) target:self action:@selector(rightItemAction:)];
    self.navigationItem.rightBarButtonItem = rightItem;

}

- (void)rightItemAction:(UIBarButtonItem *)sender {
    YXMineSettingViewController *settingVC = [[YXMineSettingViewController alloc] init];
    settingVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:settingVC animated:YES];
}


#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
        {
            return 1;
        }
            break;
        case 1:
        {
            return 2;
        }
            break;
            
        case 2:
        {
            return 3;
        }
            break;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        YXMineUserPublicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YXMineUserPublicCell" forIndexPath:indexPath];
        
        [cell setSelectUserImageViewClickBlock:^{
            YXMineUserViewController *userVC = [[YXMineUserViewController alloc] init];
            userVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:userVC animated:YES];
        }];
        
        [cell setSelectMemberBtnClickBlock:^{
            YXMineRaiseViewController *raiseVC = [[YXMineRaiseViewController alloc] init];
            raiseVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:raiseVC animated:YES];
            
        }];
        
        return cell;
    }else if (indexPath.section == 1) {
        static NSString *cellID = @"cellID";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
            cell.textLabel.font = [UIFont systemFontOfSize:16];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        NSArray *titleArr = @[@"邀请好友免费领现金",@"账户余额"];
        cell.textLabel.text = titleArr[indexPath.row];
        
        UIView *lineView = [[UIView alloc] initWithFrame:(CGRectMake(0, cell.contentView.frame.size.height - 0.5, kScreenWidth, 0.5))];
        lineView.backgroundColor = color_lineColor;
        [cell.contentView addSubview:lineView];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 2) {
        YXMineRankingViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YXMineRankingViewCell" forIndexPath:indexPath];
        NSArray *imageArr = @[@"huiyuan-diyi",@"huiyuan-dier",@"huiyuan-disan"];
        cell.levelImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageArr[indexPath.row]]];
        NSArray *arr = @[@"st",@"nd",@"rd"];
        cell.levelLab.text = [NSString stringWithFormat:@"%ld%@",indexPath.row+1,arr[indexPath.row]];
        return cell;
    }

    return [[UITableViewCell alloc] init];;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 80;
    }else {
        return 44;
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 2) {
        return self.rankingView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 2) {
        return 210;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return  section == 0 ? 10 : 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}


@end
