//
//  YXLoginView.h
//  MyWorld
//
//  Created by 杨旭 on 2017/11/20.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "BaseView.h"
typedef enum YXLoginViewType{
    ViewType_LoginView = 1 ,
    ViewType_RegistView = 1 << 1 ,
}YXLoginViewType;


@interface YXLoginView : BaseView

@property (nonatomic ,copy) void(^loginBtnTypeClickBlock)(NSInteger index);

/** 界面类型 */
@property (nonatomic, assign) YXLoginViewType type;



- (instancetype)initWithFrame:(CGRect)frame andWithTypeView:(YXLoginViewType)type;




@property (nonatomic ,strong) NSString *title;

@end
