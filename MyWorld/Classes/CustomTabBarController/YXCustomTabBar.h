//
//  YXCustomTabBar.h
//  MyWorld
//
//  Created by 杨旭 on 2017/11/21.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXCustomTabBar : UITabBar

@property (nonatomic,copy) void(^didClickPublishBtn)();

@property (nonatomic ,strong) UIButton *publishBtn;

@end
