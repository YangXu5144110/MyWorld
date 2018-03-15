//
//  YXMineRaiseDetailsViewController.m
//  MyWorld
//
//  Created by 杨旭 on 2017/12/7.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXMineRaiseDetailsViewController.h"
#import "YXRaiseDetailsTableView.h"
#import "YXRaiseToolBarView.h"
#import "YXRaiseChoseView.h"
@interface YXMineRaiseDetailsViewController ()
@property (nonatomic ,strong) YXRaiseDetailsTableView *tableView;
@property (nonatomic ,strong) YXRaiseToolBarView *toolBarView;
@property (nonatomic ,strong) YXRaiseChoseView *choseView;
@end

@implementation YXMineRaiseDetailsViewController

- (YXRaiseDetailsTableView *)tableView {
    if (!_tableView) {
        _tableView = [[YXRaiseDetailsTableView alloc] initWithFrame:(CGRectMake(0, -64, kScreenWidth, kScreenHeight - 50)) style:(UITableViewStylePlain)];
    }
    return _tableView;
}

- (YXRaiseToolBarView *)toolBarView {
    if (!_toolBarView) {
        _toolBarView = [[YXRaiseToolBarView alloc] initWithFrame:(CGRectMake(0, kScreenHeight - 50 - 64, kScreenWidth, 50))];
        YXWeakSelf
        [_toolBarView setSelectBtnClickBlock:^(NSInteger index) {
            switch (index) {
                case 0:
                {
                    
                }
                    break;
                case 1:
                {
                    
                }
                    break;
                case 2:
                {
                    [UIView animateWithDuration:0.3 animations:^{
                        weakSelf.choseView.alpha = 1;
                    }];
                }
                    break;
                default:
                    break;
            }
        }];
    }
    return _toolBarView;
}

- (YXRaiseChoseView *)choseView {
    if (!_choseView) {
        _choseView = [[YXRaiseChoseView alloc] initWithFrame:self.view.frame];
        _choseView.alpha = 0;
    }
    return _choseView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    //进入当前页面使导航变透明
    self.navigationController.navigationBar.translucent=YES;
    //1.1.1 在具有导航栏的viewController中设置导航栏透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:0];
    //这一个方法是将导航栏与主view之间的那个阴影线消除，将导航栏和view无缝连接
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewDidAppear:animated];
    //进入当前页面使导航变透明
    self.navigationController.navigationBar.translucent=NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"tongxun-bg"] forBarMetrics:0];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"多功能除菌收纳盒";
    [self createNarBarUI];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.toolBarView];
    UIWindow *rootWindow = [UIApplication sharedApplication].keyWindow;
    [rootWindow addSubview:self.choseView];
}

#pragma mark ------- 初始化导航栏
- (void)createNarBarUI {
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"quanquan-return"] style:(UIBarButtonItemStylePlain) target:self action:@selector(leftAction:)];
    leftItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"zhuye"] style:(UIBarButtonItemStylePlain) target:self action:@selector(rightAction:)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;

}
- (void)leftAction:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)rightAction:(UIBarButtonItem *)sender {
    
}

@end
