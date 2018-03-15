//
//  YXCategoryViewController.m
//  MyWorld
//
//  Created by 杨旭 on 2017/11/23.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXCategoryViewController.h"

@interface YXCategoryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSArray *imageArr;
@end

@implementation YXCategoryViewController



- (NSArray *)imageArr {
    if (!_imageArr) {
        _imageArr = @[@"shoutianjia-fabu",@"shoutianjia-xing"];
    }
    return _imageArr;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
        _tableView.scrollEnabled = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)setTitleArr:(NSArray *)titleArr {
    _titleArr = titleArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}


#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.titleArr[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.imageArr[indexPath.row]]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
