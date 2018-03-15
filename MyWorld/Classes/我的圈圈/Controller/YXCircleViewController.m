//
//  YXCircleViewController.m
//  MyWorld
//
//  Created by 杨旭 on 2017/11/21.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXCircleViewController.h"
#import "YXCircleDynamicCell.h"
#import "YXSearchBarView.h"
#import "YXCircleDetailsViewController.h"
@interface YXCircleViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) YXSearchBarView *searchBarView;
@end

@implementation YXCircleViewController

- (YXSearchBarView *)searchBarView {
    if(_searchBarView == nil) {
        _searchBarView = [[YXSearchBarView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
    }
    return _searchBarView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - kTabBarHeight)) style:(UITableViewStylePlain)];
        _tableView.backgroundColor = color_backColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableHeaderView = self.searchBarView;
        [_tableView registerClass:[YXCircleDynamicCell class] forCellReuseIdentifier:@"YXCircleDynamicCell"];
    }
    return _tableView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self scrollViewDidScroll:self.tableView];
 
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = 0;
    [self createNarUI];
    [self.view addSubview:self.tableView];
}

- (void)createNarUI {
    
    NSArray *titleArr = @[@"动态",@"圈友"];
    UISegmentedControl * segment = [[UISegmentedControl alloc] initWithItems:titleArr];
    segment.frame = CGRectMake(0, 0, 160, 30);
    segment.selectedSegmentIndex = 0;
    segment.tintColor = [UIColor whiteColor];
    [segment addTarget:self action:@selector(didClicksegmentedControlAction:) forControlEvents:(UIControlEventValueChanged)];
    self.navigationItem.titleView = segment;
}
#pragma mark - 点击顶部菜单
- (void)didClicksegmentedControlAction:(UISegmentedControl *)sender {
    
    NSInteger index = sender.selectedSegmentIndex;
    NSLog(@"Index %ld", index);
    
}

#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YXCircleDynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YXCircleDynamicCell" forIndexPath:indexPath];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 325;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YXCircleDetailsViewController *detailsVC = [[YXCircleDetailsViewController alloc] init];
    detailsVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailsVC animated:YES];
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //footerView
    if (scrollView == _tableView) {
        //去掉UItableview的section的footerview黏性
        CGFloat sectionFooterHeight = 10;
        if (scrollView.contentOffset.y<=sectionFooterHeight && scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(0, 0, -sectionFooterHeight, 0);
        } else if (scrollView.contentOffset.y>=sectionFooterHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(0, 0, -sectionFooterHeight, 0);
        }
    }
    
}
@end
