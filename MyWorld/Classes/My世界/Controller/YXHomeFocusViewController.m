//
//  YXHomeFocusViewController.m
//  MyWorld
//
//  Created by 杨旭 on 2017/12/4.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXHomeFocusViewController.h"

@interface YXHomeFocusViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@end

@implementation YXHomeFocusViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64) style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView setSeparatorInset:UIEdgeInsetsZero];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createLeftBarButtonItemWithImage:@"huiyuan-return"];
    self.title = @"我的关注";
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"focusCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:cellID];
        cell.textLabel.textColor = [UIColor orangeColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.detailTextLabel.textColor = color_textThree;
    }
    cell.imageView.image = [UIImage imageNamed:@"guanzhu-touxiang"];
    cell.textLabel.text = @"手绘插画教程";
    cell.detailTextLabel.text = @"各种眼睛的画法";
    
    UIButton *focusBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [focusBtn setImage:[UIImage imageNamed:@"guanzhu-duigou"] forState:(UIControlStateNormal)];
    [focusBtn setTitle:@"已关注" forState:(UIControlStateNormal)];
    [focusBtn setTitleColor:color_textThree forState:(UIControlStateNormal)];
    focusBtn.layer.borderWidth = 1;
    focusBtn.layer.borderColor = color_lineColor.CGColor;
    focusBtn.layer.masksToBounds = YES;
    focusBtn.layer.cornerRadius = 3.0f;
    focusBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    focusBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
    focusBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -5);
    [cell.contentView addSubview:focusBtn];
    
    __weak typeof (cell) weakSelf = cell;
    [focusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(80, 36));
    }];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

@end
