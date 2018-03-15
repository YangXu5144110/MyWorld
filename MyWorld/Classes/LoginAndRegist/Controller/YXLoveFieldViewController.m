//
//  YXLoveFieldViewController.m
//  MyWorld
//
//  Created by 杨旭 on 2017/11/23.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXLoveFieldViewController.h"
#import "YXLoveFieldView.h"
#import "YXTabBarViewController.h"
@interface YXLoveFieldViewController ()
@property (nonatomic ,strong) YXLoveFieldView *loveView;
@property (nonatomic ,strong) UIButton  *skipBtn;
@property (nonatomic ,strong) UIButton  *openBtn;
@end

@implementation YXLoveFieldViewController


- (YXLoveFieldView *)loveView {
    if (!_loveView) {
        _loveView = [[YXLoveFieldView alloc] initWithFrame:self.view.bounds];
    }
    return _loveView;
}

- (UIButton *)skipBtn {
    if (!_skipBtn) {
        _skipBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _skipBtn.frame = CGRectMake(kScreenWidth - 60, 30, 40, 20);
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"跳过"];
        NSRange strRange = {0,[str length]};
        [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
        [_skipBtn setAttributedTitle:str forState:UIControlStateNormal];
        [_skipBtn addTarget:self action:@selector(openBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _skipBtn;
}

- (UIButton *)openBtn {
    if (!_openBtn) {
        _openBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _openBtn.frame = CGRectMake(50, kScreenHeight - 150, kScreenWidth - 100, 50);
        [_openBtn setTitle:@"开启MY世界之旅" forState:(UIControlStateNormal)];
        [_openBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        _openBtn.backgroundColor = [UIColor redColor];
        _openBtn.layer.masksToBounds = YES;
        _openBtn.layer.cornerRadius = 5;
        [_openBtn addTarget:self action:@selector(openBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _openBtn;
}

- (void)openBtnAction:(UIButton *)sender {
    YXTabBarViewController *tabBarVC = [[YXTabBarViewController alloc] init];
    
    [[UIApplication sharedApplication].keyWindow setRootViewController:tabBarVC];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"选择一些您喜欢的领域";
    [self.view addSubview:self.loveView];
    [self.view addSubview:self.skipBtn];
    [self.view addSubview:self.openBtn];
}

@end
