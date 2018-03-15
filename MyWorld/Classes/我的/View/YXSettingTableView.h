//
//  YXSettingTableView.h
//  MyWorld
//
//  Created by 杨旭 on 2017/11/27.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXSettingTableView : UITableView

@property (nonatomic ,copy) void(^didSelectRowAtIndexPath)(NSInteger index,NSString *title);

@property (nonatomic ,copy) void(^exitBtnClickBlock)();

@end
