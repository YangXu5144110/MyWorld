//
//  UILabel+Extension.m
//  SameWorld
//
//  Created by 李小朋 on 2017/3/21.
//  Copyright © 2017年 杨旭. All rights reserved.
//
#define UILABEL_LINE_SPACE 6
#import "UILabel+Extension.h"
#import <objc/runtime.h>

/// 获取UIEdgeInsets在水平方向上的值
CG_INLINE CGFloat
UIEdgeInsetsGetHorizontalValue(UIEdgeInsets insets) {
    return insets.left + insets.right;
}

/// 获取UIEdgeInsets在垂直方向上的值
CG_INLINE CGFloat
UIEdgeInsetsGetVerticalValue(UIEdgeInsets insets) {
    return insets.top + insets.bottom;
}

CG_INLINE void
ReplaceMethod(Class _class, SEL _originSelector, SEL _newSelector) {
    Method oriMethod = class_getInstanceMethod(_class, _originSelector);
    Method newMethod = class_getInstanceMethod(_class, _newSelector);
    BOOL isAddedMethod = class_addMethod(_class, _originSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    if (isAddedMethod) {
        class_replaceMethod(_class, _newSelector, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
    } else {
        method_exchangeImplementations(oriMethod, newMethod);
    }
}


@implementation UILabel (Extension)

+ (instancetype)setLabelWithText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)color {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:fontSize];
    
    
    return label;
}

+ (instancetype)setLabelWithText:(NSString *)text fontSize:(CGFloat)fontSize fontName:(NSString *)fontName color:(UIColor *)color {

    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = color;
    label.font = text_TextName;
    
    return label;
}


-(void)setLabelSpaceLabel:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font space:(NSString *)space{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = UILABEL_LINE_SPACE; //设置行间距
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSFontAttributeName:font,NSParagraphStyleAttributeName:paraStyle,NSKernAttributeName:space};
    
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    label.attributedText = attributeStr;
}


- (CGFloat)getTextWidth
{
    CGSize newSize = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, self.H) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size;
    
    return newSize.width;
}

- (CGFloat)getTextHeight
{
    CGSize newSize = [self.text boundingRectWithSize:CGSizeMake(self.W, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size;
    
    return newSize.height;
}







@end
