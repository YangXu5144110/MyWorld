//
//  YXRaiseHeaderView.m
//  MyWorld
//
//  Created by 杨旭 on 2017/12/1.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXRaiseHeaderView.h"

@interface YXRaiseHeaderView ()
@property (nonatomic ,strong) NSArray *titleArr;
@property (nonatomic ,strong) NSArray *imageArr;
@end

@implementation YXRaiseHeaderView

- (NSArray *)titleArr {
    if (!_titleArr) {
        _titleArr = @[@"文字",@"图片",@"视频",@"众筹"];
    }
    return _titleArr;
}

- (NSArray *)imageArr {
    if (!_imageArr) {
        _imageArr = @[@"zhongchou-wenzi",@"zhongchou-tupian",@"zhongchou-shipin",@"zhongchou-zhongchou"];
    }
    return _imageArr;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
    for (int i = 0; i < self.titleArr.count; i ++) {
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        btn.frame = CGRectMake((kScreenWidth / 4) * i, 0, kScreenWidth/4, 100);
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitle:self.titleArr[i] forState:(UIControlStateNormal)];
        [btn setTitleColor:color_textTwo forState:(UIControlStateNormal)];
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",self.imageArr[i]]] forState:(UIControlStateNormal)];
        [btn setImgViewStyle:(ButtonImgViewStyleTop) imageSize:(CGSizeMake(30, 30)) space:11];
        [self addSubview:btn];
    }
    
    
}

@end
