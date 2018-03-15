//
//  YXHomeCell.h
//  MyWorld
//
//  Created by 杨旭 on 2017/11/23.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXHomeCell : UITableViewCell

@property (nonatomic ,copy)void(^userBtnClickBlock)();
@property (nonatomic ,copy)void(^focusBtnClickBlock)();
@end
