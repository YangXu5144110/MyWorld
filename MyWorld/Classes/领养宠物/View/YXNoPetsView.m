//
//  YXNoPetsView.m
//  MyWorld
//
//  Created by 杨旭 on 2017/11/22.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXNoPetsView.h"

@interface YXNoPetsView ()
@property (nonatomic ,strong) UIImageView *backImageView;
@end

@implementation YXNoPetsView

- (UIImageView *)backImageView {
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wochongwu-chongwu"]];
        _backImageView.center = self.center;
    }
    return _backImageView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = color_backColor;
        [self addSubview:self.backImageView];
    }
    return self;
}

@end
