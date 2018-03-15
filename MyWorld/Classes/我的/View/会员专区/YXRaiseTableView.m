//
//  YXRaiseTableView.m
//  MyWorld
//
//  Created by 杨旭 on 2017/12/1.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXRaiseTableView.h"
#import "YXRaiseCell.h"
@interface YXRaiseTableView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UIView *headerView;
@end

@implementation YXRaiseTableView

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 60))];
        UILabel *titleLab = [UILabel setLabelWithText:@"众筹项目" fontSize:22 color:[UIColor redColor]];
        titleLab.frame = CGRectMake(0, 10, kScreenWidth, 50);
        titleLab.backgroundColor = [UIColor whiteColor];
        titleLab.textAlignment = NSTextAlignmentCenter;
        [_headerView addSubview:titleLab];
    }
    return _headerView;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.backgroundColor = color_backColor;
        self.dataSource = self;
        self.delegate = self;
        self.tableHeaderView = self.headerView;
        [self registerNib:[UINib nibWithNibName:@"YXRaiseCell" bundle:nil] forCellReuseIdentifier:@"YXRaiseCell"];
    }
    return self;
}

#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YXRaiseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YXRaiseCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 0 ? 0 : 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] init];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didSelectRowAtIndexPath) {
        self.didSelectRowAtIndexPath(indexPath.row);
    }
    
}
@end
