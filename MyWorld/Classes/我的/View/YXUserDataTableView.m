//
//  YXUserDataTableView.m
//  MyWorld
//
//  Created by 杨旭 on 2017/12/4.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXUserDataTableView.h"

@interface YXUserDataTableView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) NSArray *titleArr;
@end

@implementation YXUserDataTableView

- (NSArray *)titleArr {
    if (!_titleArr) {
        _titleArr = @[@"ID 号：",@"性 别：",@"年 龄：",@"宠 物：",@"标 签："];
    }
    return _titleArr;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.dataSource = self;
        self.delegate = self;
        self.scrollEnabled = NO;
        self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return self;
}

#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"userCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.titleArr[indexPath.row];
    return cell;
}

@end

