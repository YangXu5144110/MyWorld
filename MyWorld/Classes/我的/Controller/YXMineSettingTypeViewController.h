//
//  YXMineSettingTypeViewController.h
//  MyWorld
//
//  Created by 杨旭 on 2017/12/11.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "BaseViewController.h"
typedef NS_ENUM(NSInteger,settingTypeView) {
    Setting_Password,       // 修改密码
    Setting_Notice,         // 消息通知
    Setting_Opinion,        // 意见与反馈
    Setting_About           // 关于
};
@interface YXMineSettingTypeViewController : BaseViewController
@property (nonatomic ,assign) settingTypeView typeView;

@end
