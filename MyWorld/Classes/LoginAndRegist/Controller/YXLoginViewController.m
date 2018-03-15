//
//  YXLoginViewController.m
//  MyWorld
//
//  Created by 杨旭 on 2017/11/20.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXLoginViewController.h"
#import "YXLoginView.h"
#import "YXTabBarViewController.h"
#import "YXLoveFieldViewController.h"
@interface YXLoginViewController ()
@property (nonatomic ,strong) YXLoginView *loginView;
@end

@implementation YXLoginViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"%u",self.viewType);
    [self createUI];
}

- (void)createUI {

    switch (self.viewType) {
        case LoginView:
        {
            YXLoginView *loginView = [[YXLoginView alloc] initWithFrame:self.view.bounds andWithTypeView:ViewType_LoginView];
            [self.view addSubview:loginView];
            
            YXWeakSelf
            [loginView setLoginBtnTypeClickBlock:^(NSInteger index) {
                
                switch (index) {
                    case 0:     // 登录
                    {
                        YXTabBarViewController *tabBarVC = [[YXTabBarViewController alloc] init];
                        
                        [[UIApplication sharedApplication].keyWindow setRootViewController:tabBarVC];
//                        YXLoveFieldViewController *lfVC = [[YXLoveFieldViewController alloc] init];
//                        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:lfVC];
//                        [[UIApplication sharedApplication].keyWindow setRootViewController:nav];

                    }
                        break;
                    case 1:     // 注册
                    {

                        YXLoginViewController *registVC = [[YXLoginViewController alloc] init];
                        registVC.viewType = RegistView;
                        [weakSelf.navigationController pushViewController:registVC animated:YES];
                    }
                        break;
                    case 2:     // 第三方登录
                    {
                        
                    }
                        break;
                    case 3:     // 忘记密码
                    {
                        
                    }
                        break;
                    default:
                        break;
                }
                

            }];
            
        }
            
            break;
        case RegistView:
        {
             YXLoginView *registView = [[YXLoginView alloc] initWithFrame:self.view.bounds andWithTypeView:ViewType_RegistView];
            registView.title = @"登录？";
            [self.view addSubview:registView];
            
            
            YXWeakSelf
            [registView setLoginBtnTypeClickBlock:^(NSInteger index) {
                switch (index) {
                    case 0:
                    {
                        
                    }
                        break;
                    case 1:
                    {
                        [self.navigationController popViewControllerAnimated:YES];
                      
                    }
                        break;
                        
                    default:
                        break;
                }
            }];
            
        }
            
            break;
        default:
            break;
    }
    
}




@end
