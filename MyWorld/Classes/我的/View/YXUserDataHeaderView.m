//
//  YXUserDataHeaderView.m
//  MyWorld
//
//  Created by 杨旭 on 2017/12/4.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXUserDataHeaderView.h"

@interface YXUserDataHeaderView ()
@property (nonatomic ,strong) UIImageView *backImageView;
@property (nonatomic ,strong) UIButton *userBtn;
@property (nonatomic ,strong) UIImageView *cameraImageView;
@property (nonatomic ,strong) UILabel *userLab;
@property (nonatomic ,strong) UILabel *signatureLab;
@end

@implementation YXUserDataHeaderView

- (UIImageView *)backImageView {
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"geren-bg"]];
    }
    return _backImageView;
}
- (UIButton *)userBtn {
    if (!_userBtn) {
        _userBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_userBtn setImage:[UIImage imageNamed:@"gerenziliaotouxiang"] forState:(UIControlStateNormal)];
    }
    return _userBtn;
}

- (UIImageView *)cameraImageView {
    if (!_cameraImageView) {
        _cameraImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo_gerenziliao"]];
    }
    return _cameraImageView;
}

- (UILabel *)userLab {
    if (!_userLab) {
        _userLab = [UILabel setLabelWithText:@"MY世界" fontSize:20 color:[UIColor blackColor]];
        _userLab.textAlignment = NSTextAlignmentCenter;
    }
    return _userLab;
}
- (UILabel *)signatureLab {
    if (!_signatureLab) {
        _signatureLab = [UILabel setLabelWithText:@"这是一个很长很长的一句签名" fontSize:14 color:color_textThree];
        _signatureLab.textAlignment = NSTextAlignmentCenter;

    }
    return _signatureLab;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backImageView];
        [self addSubview:self.userBtn];
        [self addSubview:self.cameraImageView];
        [self addSubview:self.userLab];
        [self addSubview:self.signatureLab];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    YXWeakSelf
    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(0);
        make.left.equalTo(weakSelf.mas_left).offset(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 180));
    }];
    
    [_userBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.centerY.equalTo(_backImageView.mas_bottom);
        [_userBtn sizeToFit];
    }];
    
    [_cameraImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.centerY.equalTo(_backImageView.mas_bottom);
        [_cameraImageView sizeToFit];
    }];
    
    [_userLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.top.equalTo(_userBtn.mas_bottom).offset(5);
        [_userLab sizeToFit];
    }];
    
    [_signatureLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.top.equalTo(_userLab.mas_bottom).offset(10);
        [_signatureLab sizeToFit];
    }];
}


@end
