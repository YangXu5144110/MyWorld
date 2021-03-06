//
//  UILabel+Extension.h
//  SameWorld
//
//  Created by 李小朋 on 2017/3/21.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

/**
 *  设置常规的字体
 */
+ (instancetype)setLabelWithText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)color;

/**
 *  设置微软雅黑的字体
 */
+ (instancetype)setLabelWithText:(NSString *)text fontSize:(CGFloat)fontSize fontName:(NSString *)fontName color:(UIColor *)color;


/**
 *  按照自定义尺寸大小，对字体间距设置px像素
 */
- (void)setLabelSpaceLabel:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font space:(NSString *)space;

/**
 *  设置常规的字体
 */
//- (void)setLabelWithFontSize:(CGFloat)fontSize color:(UIColor *)color;

- (CGFloat)getTextWidth;
- (CGFloat)getTextHeight;



@end
