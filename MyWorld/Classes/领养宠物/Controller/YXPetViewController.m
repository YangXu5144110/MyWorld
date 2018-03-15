//
//  YXPetViewController.m
//  MyWorld
//
//  Created by 杨旭 on 2017/11/21.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXPetViewController.h"
#import "YXNoPetsView.h"
@interface YXPetViewController ()

@end

@implementation YXPetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.title = @"我的宠物";
    [self createUI];
}

- (void)createUI {
    YXNoPetsView *noPetsView = [[YXNoPetsView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:noPetsView];
}


@end
