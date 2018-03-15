//
//  YXHomeCell.m
//  MyWorld
//
//  Created by 杨旭 on 2017/11/23.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXHomeCell.h"

@interface YXHomeCell ()
@property (nonatomic ,strong) UIImageView *userImageView;
@property (nonatomic ,strong) UILabel *userLab;
@property (nonatomic ,strong) UILabel *timeLab;
@property (nonatomic ,strong) UIButton *userBtn;
@property (nonatomic ,strong) UIImageView *picImageView;
@property (nonatomic ,strong) UILabel *contentLab;
@property (nonatomic ,strong) UIButton *focusBtn;
@end

@implementation YXHomeCell

- (UIImageView *)userImageView {
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"touxiang2"]];
    }
    return _userImageView;
}

- (UILabel *)userLab {
    if (!_userLab) {
        _userLab = [UILabel setLabelWithText:@"月牙儿" fontSize:16 color:color_textOne];
    }
    return _userLab;
}
- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel setLabelWithText:@"2017-6-01 14:20" fontSize:14 color:color_textTwo];
    }
    return _timeLab;
}

- (UIButton *)userBtn {
    if (!_userBtn) {
        _userBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_userBtn addTarget:self action:@selector(userBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _userBtn;
}

- (void)userBtnAction:(UIButton *)sender {
    if (self.userBtnClickBlock) {
        self.userBtnClickBlock();
    }
}

- (UIImageView *)picImageView {
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ranshaoshenghuo"]];
    }
    return _picImageView;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel setLabelWithText:@"燃烧生活，堆积醒过的梦。 Kindle fire to life， and dump all the waken dreams。" fontSize:14 color:color_textOne];
        _contentLab.lineBreakMode = NSLineBreakByWordWrapping;
        _contentLab.numberOfLines = 2;
    }
    return _contentLab;
}

- (UIButton *)focusBtn {
    if (!_focusBtn) {
        _focusBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_focusBtn setTitleColor:[UIColor greenColor] forState:(UIControlStateNormal)];
        [_focusBtn setTitle:@"+ 关注" forState:(UIControlStateNormal)];
        _focusBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _focusBtn.layer.masksToBounds = YES;
        _focusBtn.layer.cornerRadius = 3 ;
        _focusBtn.layer.borderColor = [UIColor greenColor].CGColor;
        _focusBtn.layer.borderWidth = 1;
        [_focusBtn addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _focusBtn;
}

- (void)action:(UIButton *)sender {
    if (self.focusBtnClickBlock) {
        self.focusBtnClickBlock();
    }
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.userImageView];
        [self.contentView addSubview:self.userLab];
        [self.contentView addSubview:self.timeLab];
        [self.contentView addSubview:self.userBtn];
        [self.contentView addSubview:self.picImageView];
        [self.contentView addSubview:self.contentLab];
        [self.contentView addSubview:self.focusBtn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    YXWeakSelf
    [_userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.top.equalTo(weakSelf.mas_top).offset(15);
        make.size.mas_equalTo(CGSizeMake(45, 45));
    }];
    
    [_userLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_userImageView.mas_right).offset(10);
        make.top.equalTo(weakSelf.mas_top).offset(20);
        [_userLab sizeToFit];
    }];
    
    [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_userImageView.mas_right).offset(10);
        make.top.equalTo(_userLab.mas_bottom).offset(5);
        [_timeLab sizeToFit];
    }];
    
    [_userBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.top.equalTo(weakSelf.mas_top).offset(10);
        make.size.mas_equalTo(CGSizeMake(200, 55));
    }];
    
    [_focusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_userImageView.mas_centerY);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.size.mas_equalTo(CGSizeMake(70, 30));
    }];
    
    [_picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.top.equalTo(_userImageView.mas_bottom).offset(10);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.height.offset(150);
    }];
    
    [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_picImageView.mas_bottom).offset(10);
        make.left.equalTo(weakSelf.mas_left).offset(30);
        make.right.equalTo(weakSelf.mas_right).offset(-30);
        [_contentLab sizeToFit];
    }];
}

@end
