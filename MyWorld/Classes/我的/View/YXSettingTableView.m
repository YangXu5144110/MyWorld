//
//  YXSettingTableView.m
//  MyWorld
//
//  Created by 杨旭 on 2017/11/27.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXSettingTableView.h"

@interface YXSettingTableView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) NSArray *titleArr;
@property (nonatomic ,strong) UIButton *exitBtn;
@end

@implementation YXSettingTableView

- (NSArray *)titleArr {
    if (!_titleArr) {
        _titleArr = @[@"修改密码",@"消息通知",@"意见与反馈",@"关于",@"版本更新"];
    }
    return _titleArr;
}

- (UIButton *)exitBtn {
    if (!_exitBtn) {
        _exitBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _exitBtn.frame = CGRectMake(0, 1, kScreenWidth, 50);
        _exitBtn.backgroundColor = [UIColor whiteColor];
        [_exitBtn setTitle:@"退出当前登录" forState:(UIControlStateNormal)];
        [_exitBtn setTitleColor:color_textOne forState:(UIControlStateNormal)];
        [_exitBtn addTarget:self action:@selector(exitBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _exitBtn;
}

- (void)exitBtnAction:(UIButton *)sender {
    self.exitBtnClickBlock();
}


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.backgroundColor = color_backColor;
        self.dataSource = self;
        self.delegate = self;
//        self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        [self setSeparatorInset:UIEdgeInsetsZero];
        UIView *footerView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 50))];
        [footerView addSubview:self.exitBtn];
        self.tableFooterView = footerView;
    }
    return self;
}

#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"settingCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:cellID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = self.titleArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.didSelectRowAtIndexPath) {
        self.didSelectRowAtIndexPath(indexPath.row,self.titleArr[indexPath.row]);
    }
}


@end
