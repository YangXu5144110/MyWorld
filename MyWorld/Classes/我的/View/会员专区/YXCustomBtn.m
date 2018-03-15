//
//  YXCustomBtn.m
//  MyWorld
//
//  Created by 杨旭 on 2017/12/11.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXCustomBtn.h"

@interface YXCustomBtn ()
@property (nonatomic ,strong) UILabel *titleLab;
@property (nonatomic ,strong) UILabel *contentLab;
@end

@implementation YXCustomBtn

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title content:(NSString *)content
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 4.0f;
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 1.0f;
        
        UILabel *titleLab = [UILabel setLabelWithText:title fontSize:15 color:color_textOne];
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.frame = CGRectMake(0, 20, self.frame.size.width, 20);
        [self addSubview:titleLab];
        
        UILabel *contentLab = [UILabel setLabelWithText:content fontSize:15 color:color_textOne];
        contentLab.frame = CGRectMake(0, titleLab.H + 10, self.frame.size.width, 20);
        contentLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:contentLab];

    }
    return self;
}


@end
