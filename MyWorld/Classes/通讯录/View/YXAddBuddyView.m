//
//  YXAddBuddyView.m
//  MyWorld
//
//  Created by 杨旭 on 2017/12/12.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXAddBuddyView.h"

@interface YXAddBuddyView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSArray *titleArr;
@property (nonatomic ,strong) NSArray *imageArr;
@end

@implementation YXAddBuddyView

- (NSArray *)titleArr {
    if (!_titleArr) {
        _titleArr = @[@"添加手机联系人",@"添加微信好友",@"扫一扫添加好友"];
    }
    return _titleArr;
}
- (NSArray *)imageArr {
    if (!_imageArr) {
        _imageArr = @[@"tianhao-jia",@"tianhao-weixin",@"tianhao-saoyisao"];
    }
    return _imageArr;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:(UITableViewStylePlain)];
        _tableView.backgroundColor = color_backColor;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = [self getHeaderView];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _tableView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor =color_backColor;
        [self addSubview:self.tableView];
    }
    return self;
}

- (UIView *)getHeaderView {
    UIView *headerView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 64))];
    headerView.backgroundColor = color_backColor;
    
    UIView *backView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0,kScreenWidth, 44))];
    backView.backgroundColor = [UIColor whiteColor];
    [headerView addSubview:backView];
    
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tianhao-sousuo"]];
    image.frame = CGRectMake(15, 12, 20, 20);
    [backView addSubview:image];
    
    UITextField *search = [[UITextField alloc] initWithFrame:(CGRectMake(image.W + image.X + 20, 0, kScreenWidth, 44))];
    search.placeholder = @"搜索ID账号/群";
    [backView addSubview:search];
    
    return headerView;
}

#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"addCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:cellID];
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tianhao-xiang"]];
        cell.accessoryView = image;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = self.titleArr[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.imageArr[indexPath.row]]];
    return cell;
}


@end
