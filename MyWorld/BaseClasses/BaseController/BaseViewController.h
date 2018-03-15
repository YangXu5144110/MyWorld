//
//  BaseViewController.h
//  LearnToHelp
//
//  Created by 杨旭 on 2017/11/6.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import <UIKit/UIKit.h>
//加密
#import <CommonCrypto/CommonDigest.h>

@interface BaseViewController : UIViewController
/** yanse */
@property (nonatomic, strong) UIColor *rightColor;

@property (nonatomic, strong) UIButton *leftBarButton;
@property (nonatomic, strong) UIButton *rightBarButton;

/** 请求数据 */
- (void)requestData;

/** 左侧  右侧按钮带标题初始化方法 */
- (void)createLeftBarButtonItemWithImage:(NSString *)leftImage andRightImage:(NSString *)rightImage;
/** 右侧按钮调用 */
- (void)rightBarBtnItemAction;
/** 左侧按钮调用 */
- (void)leftBarBtnItemAction;


// 弹出提醒用户
-(void)showAlertWith:(NSString *)messge;
// 弹出提醒用户
-(void)showAlertWithTitle:(NSString *)title;

@property (nonatomic, strong) NSString *rightTitle;

- (void)createLeftBarButtonItemWithImage:(NSString *)leftImage;
- (void)createWhiteNarBackgroundLeftBarWithImage:(NSString *)leftImage;
- (void)rightBarBtnItemAction:(UIButton *)sender;

/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:    虚线的间距
 ** lineColor:      虚线的颜色
 **/
- (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

#pragma mark -- 调取MD5加密
- (NSString *)passwordToMD5:(NSString *)password;

#pragma mark - 判断手机号
- (NSString *)valiMobile:(NSString *)mobile;


@end
