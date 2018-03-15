//
//  YXMineUserPublicCell.m
//  MyWorld
//
//  Created by 杨旭 on 2017/11/21.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXMineUserPublicCell.h"

@interface YXMineUserPublicCell ()
@property (nonatomic ,strong) UIImageView *userImageView;
@property (nonatomic ,strong) UILabel *userNameLab;
@property (nonatomic ,strong) UILabel *signatureLab;
@property (nonatomic ,strong) UILabel *numberLab;
@property (nonatomic ,strong) UIButton *mbLBtn;
@property (nonatomic ,strong) UILabel *levelLab;
@property (nonatomic ,strong) UIButton *memberBtn;
@end

@implementation YXMineUserPublicCell

- (UIImageView *)userImageView {
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"huiyuan-touxiang"]];
        _userImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userImageViewTap:)];
        [_userImageView addGestureRecognizer:tap];
    }
    return _userImageView;
}
- (void)userImageViewTap:(UITapGestureRecognizer *)sender {
    if (self.selectUserImageViewClickBlock) {
        self.selectUserImageViewClickBlock();
    }
    
}

- (UILabel *)userNameLab {
    if (!_userNameLab) {
        _userNameLab = [UILabel setLabelWithText:@"MY世界" fontSize:16 color:color_textOne];
    }
    return _userNameLab;
}

- (UILabel *)signatureLab {
    if (!_signatureLab) {
        _signatureLab = [UILabel setLabelWithText:@"这是一句很长的签名" fontSize:14 color:color_textTwo];
    }
    return _signatureLab;
}

- (UILabel *)numberLab {
    if (!_numberLab) {
        _numberLab = [UILabel setLabelWithText:@"ID: 666666" fontSize:14 color:color_textTwo];
    }
    return _numberLab;
}

- (UIButton *)mbLBtn {
    if (!_mbLBtn) {
        _mbLBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_mbLBtn setImage:[UIImage imageNamed:@"huiyuan-huanguan"] forState:(UIControlStateNormal)];
        [_mbLBtn setTitle:@"皇冠会员" forState:(UIControlStateNormal)];
        [_mbLBtn setTitleColor:color_textTwo forState:(UIControlStateNormal)];
        _mbLBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _mbLBtn;
}
- (UILabel *)levelLab {
    if (!_levelLab) {
        _levelLab = [UILabel setLabelWithText:@"等级：LV50" fontSize:12 color:color_textTwo];
    }
    return _levelLab;
}
- (UIButton *)memberBtn {
    if (!_memberBtn) {
        _memberBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_memberBtn setImage:[UIImage imageNamed:@"huiyuanzhuanqu"] forState:(UIControlStateNormal)];
        [_memberBtn addTarget:self action:@selector(memberBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _memberBtn;
}
- (void)memberBtn:(UIButton *)sender {
    if (self.selectMemberBtnClickBlock) {
        self.selectMemberBtnClickBlock();
    }
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.userImageView];
        [self.contentView addSubview:self.userNameLab];
        [self.contentView addSubview:self.signatureLab];
        [self.contentView addSubview:self.numberLab];
        [self.contentView addSubview:self.mbLBtn];
        [self.contentView addSubview:self.levelLab];
        [self.contentView addSubview:self.memberBtn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    YXWeakSelf
    [_userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    [_userNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_userImageView.mas_right).offset(10);
        make.top.equalTo(weakSelf.mas_top).offset(10);
        [_userNameLab sizeToFit];
    }];
    
    [_signatureLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_userImageView.mas_right).offset(10);
        make.top.equalTo(_userNameLab.mas_bottom).offset(5);
        [_signatureLab sizeToFit];
    }];
    
    [_numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_userImageView.mas_right).offset(10);
        make.top.equalTo(_signatureLab.mas_bottom).offset(5);
        [_numberLab sizeToFit];
    }];

    [_mbLBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        make.top.equalTo(weakSelf.mas_top).offset(10);
        [_mbLBtn sizeToFit];
    }];
    
    [_levelLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_mbLBtn.mas_centerX);
        make.top.equalTo(_mbLBtn.mas_bottom).offset(5);
        [_levelLab sizeToFit];
    }];
    
    [_memberBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(0);
        make.top.equalTo(_levelLab.mas_bottom).offset(8);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(0);
        
    }];
}


@end
