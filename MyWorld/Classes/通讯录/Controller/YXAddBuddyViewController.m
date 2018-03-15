//
//  YXAddBuddyViewController.m
//  MyWorld
//
//  Created by 杨旭 on 2017/12/12.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXAddBuddyViewController.h"
#import "YXAddBuddyView.h"
@interface YXAddBuddyViewController ()
@property (nonatomic ,strong) YXAddBuddyView *addView;
@end

@implementation YXAddBuddyViewController

- (YXAddBuddyView *)addView {
    if (!_addView) {
        _addView = [[YXAddBuddyView alloc] initWithFrame:self.view.bounds];
    }
    return _addView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createLeftBarButtonItemWithImage:@"huiyuan-return"];
    self.title = @"添加";
    [self.view addSubview:self.addView];
}


@end
