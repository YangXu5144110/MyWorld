//
//  YXRaiseTableView.h
//  MyWorld
//
//  Created by 杨旭 on 2017/12/1.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXRaiseTableView : UITableView

@property (nonatomic ,copy)void(^didSelectRowAtIndexPath)(NSInteger index);

@end
