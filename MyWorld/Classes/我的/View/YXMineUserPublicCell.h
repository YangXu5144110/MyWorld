//
//  YXMineUserPublicCell.h
//  MyWorld
//
//  Created by 杨旭 on 2017/11/21.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXMineUserPublicCell : UITableViewCell

@property (nonatomic ,copy)void(^selectUserImageViewClickBlock)();
@property (nonatomic ,copy)void(^selectMemberBtnClickBlock)();

@end
