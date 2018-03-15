//
//  YXLoginViewController.h
//  MyWorld
//
//  Created by 杨旭 on 2017/11/20.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "BaseViewController.h"

typedef enum LoginOrRegistViewType{
    LoginView = 1,
    RegistView = 1 << 1,
}LoginOrRegistViewType;

@interface YXLoginViewController : BaseViewController

/** 界面类型 */
@property (nonatomic, assign) LoginOrRegistViewType viewType;

@end
