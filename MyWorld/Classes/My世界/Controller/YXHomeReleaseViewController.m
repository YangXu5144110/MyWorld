//
//  YXHomeReleaseViewController.m
//  MyWorld
//
//  Created by 杨旭 on 2017/12/7.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXHomeReleaseViewController.h"
#import "YXHomeReleaseView.h"
@interface YXHomeReleaseViewController ()
@property (nonatomic ,strong) YXHomeReleaseView *releaseView;
@end

@implementation YXHomeReleaseViewController

- (YXHomeReleaseView *)releaseView {
    if (!_releaseView) {
        _releaseView = [[YXHomeReleaseView alloc] initWithFrame:self.view.bounds];
    }
    return _releaseView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createLeftBarButtonItemWithImage:@"huiyuan-return"];
    [self.view addSubview:self.releaseView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[self getSendBtnRightItem]];
}

- (UIButton *)getSendBtnRightItem {
    UIButton *sendBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    sendBtn.frame = CGRectMake(0, 0, 60, 30);
    [sendBtn setBackgroundColor:[UIColor greenColor]];
    [sendBtn setTitle:@"发送" forState:(UIControlStateNormal)];
    [sendBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    sendBtn.layer.masksToBounds = YES;
    sendBtn.layer.cornerRadius = 2.0f;
    return sendBtn;
}





@end
