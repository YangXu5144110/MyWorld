//
//  YXHomeViewController.m
//  MyWorld
//
//  Created by 杨旭 on 2017/11/20.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXHomeViewController.h"
#import "YXHomeCell.h"
#import "YXHomeFooterView.h"
#import "YXCategoryViewController.h"
#import "YXHomeDetailsViewController.h"
#import "YXHomeFocusViewController.h"
#import "YXHomeReleaseViewController.h"
@interface YXHomeViewController ()<UITableViewDelegate,UITableViewDataSource,UIPopoverPresentationControllerDelegate>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) UIButton *circleBtn;
@end

@implementation YXHomeViewController


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - kTabBarHeight)) style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        UIView *footerView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 80))];
//        footerView.backgroundColor = [UIColor redColor];
        _tableView.tableFooterView = footerView;
        [_tableView registerClass:[YXHomeCell class] forCellReuseIdentifier:@"YXHomeCell"];
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
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self createNarUI];
    [self.view addSubview:self.tableView];
}

- (void)createNarUI {
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(addItemAction:)];
    addItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = addItem;
    
    UIBarButtonItem *releaseItem = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:(UIBarButtonItemStylePlain) target:self action:@selector(releaseItemAction:)];
    releaseItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = releaseItem;
    
    self.navigationItem.titleView = [self getCircleButton];
}
- (void)addItemAction:(UIBarButtonItem *)sender {
    [self showPopViewWithBarItem:sender withDataArr:@[@"我的发布",@"我的关注"]];
}
- (void)releaseItemAction:(UIBarButtonItem *)sender {
    YXHomeReleaseViewController *releaseVC = [[YXHomeReleaseViewController alloc] init];
    releaseVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:releaseVC animated:YES];
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    // 此处为不适配(如果选择其他,会自动视频屏幕,上面设置的大小就毫无意义了)
    return UIModalPresentationNone;
}

- (void)showPopViewWithBarItem:(UIBarButtonItem *)barItem  withDataArr:(NSArray *)dataArr {

    // 此为自定义的ViewController
    YXCategoryViewController *view = [[YXCategoryViewController alloc] init];
    // 设定大小(此处也可不做设置,不做设置的效果如下图)
    view.preferredContentSize = CGSizeMake(130, 88);
    // 初始化
    view.modalPresentationStyle = UIModalPresentationPopover;
    
    view.titleArr = dataArr;
    
    UIPopoverPresentationController *popVC = view.popoverPresentationController;
    // 设置代理(iPhone必须设置代理才能显示)
    popVC.delegate = self;
    // 获取按钮
    popVC.barButtonItem = barItem;
    
    // 退出视图
    [self presentViewController:view animated:YES completion:nil];
    
}

- (UIButton *)getCircleButton {
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 31, 22, 22)];
    [btn setTitle:@"世界圈" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [btn setImage:[UIImage imageNamed:@"tongxun-xiala"] forState:UIControlStateNormal];
    [btn setImgViewStyle:(ButtonImgViewStyleRight) imageSize:(CGSizeMake(12, 12)) space:5];
    [btn addTarget:self action:@selector(clickToCircleButton:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void)clickToCircleButton:(UIButton *)sender {
 

}

#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YXHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YXHomeCell" forIndexPath:indexPath];
    [cell setUserBtnClickBlock:^{
        YXHomeDetailsViewController *detailsVC = [[YXHomeDetailsViewController alloc] init];
        detailsVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:detailsVC animated:YES];
    }];
    
    [cell setFocusBtnClickBlock:^{
        YXHomeFocusViewController *focusVC = [[YXHomeFocusViewController alloc] init];
        focusVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:focusVC animated:YES];
    }];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 300;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    YXHomeFooterView *footerView = [[YXHomeFooterView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 80)) withDataArray:nil];
    return footerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 80;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //footerView
    if (scrollView == _tableView) {
        //去掉UItableview的section的footerview黏性
        CGFloat sectionFooterHeight = 80;
        if (scrollView.contentOffset.y<=sectionFooterHeight && scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(0, 0, -sectionFooterHeight, 0);
        } else if (scrollView.contentOffset.y>=sectionFooterHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(0, 0, -sectionFooterHeight, 0);
        }
        
    
    }
    
}

@end
