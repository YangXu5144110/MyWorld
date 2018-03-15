//
//  YXSearchBarView.m
//  MyWorld
//
//  Created by 杨旭 on 2017/11/21.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXSearchBarView.h"

@interface YXSearchBarView ()<UISearchBarDelegate>

@property (nonatomic ,strong) UISearchBar *searchBar;

@end

@implementation YXSearchBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.searchBar];

    }
    return self;
}

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
        _searchBar.backgroundColor = [UIColor whiteColor];
        _searchBar.placeholder = @"请输入搜索内容";
        _searchBar.layer.cornerRadius = 15;
        _searchBar.layer.masksToBounds = YES;
        _searchBar.delegate = self;
        _searchBar.frame = CGRectMake(20, 10, kScreenWidth - 40, 30);
        UIImage* searchBarBg = [self GetImageWithColor:[UIColor py_colorWithHexString:@"#E4E4E4"] andHeight:32.0f];
        //设置背景图片
        [_searchBar setBackgroundImage:searchBarBg];
        //设置背景色
        [_searchBar setBackgroundColor:[UIColor clearColor]];
        //设置文本框背景
        [_searchBar setSearchFieldBackgroundImage:searchBarBg forState:UIControlStateNormal];
    
    }
    return _searchBar;
}

/**
 *  生成图片
 *
 *  @param color  图片颜色
 *  @param height 图片高度
 *
 *  @return 生成的图片
 */
- (UIImage*) GetImageWithColor:(UIColor*)color andHeight:(CGFloat)height
{
    CGRect r= CGRectMake(0.0f, 0.0f, 1.0f, height);
    UIGraphicsBeginImageContext(r.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, r);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}


@end
