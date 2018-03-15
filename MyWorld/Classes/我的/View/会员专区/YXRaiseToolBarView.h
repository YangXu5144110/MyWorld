//
//  YXRaiseToolBarView.h
//  MyWorld
//
//  Created by 杨旭 on 2017/12/11.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "BaseView.h"

@interface YXRaiseToolBarView : BaseView

@property (nonatomic ,copy)void(^selectBtnClickBlock)(NSInteger index);
-(instancetype)initWithFrame:(CGRect)frame;
@end
