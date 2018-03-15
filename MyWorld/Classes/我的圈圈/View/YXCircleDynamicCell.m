//
//  YXCircleDynamicCell.m
//  MyWorld
//
//  Created by 杨旭 on 2017/11/21.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXCircleDynamicCell.h"

@interface YXCircleDynamicCell ()

@property (nonatomic ,strong) UIImageView *picImageView;
@property (nonatomic ,strong) UILabel *nameLab;
@property (nonatomic ,strong) UILabel *timeLab;
@property (nonatomic ,strong) UILabel *contentLab;
@property (nonatomic ,strong) UIImageView *contentImageView;
@property (nonatomic ,strong) UIButton *focusBtn;
@property (nonatomic ,strong) UIButton *replyBtn;
@end

@implementation YXCircleDynamicCell

- (UIImageView *)picImageView {
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"woquan-rentou"]];
    }
    return _picImageView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel setLabelWithText:@"大仙贝" fontSize:14 color:color_textOne];
    }
    return _nameLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel setLabelWithText:@"5月以前" fontSize:12 color:color_textThree];
    }
    return  _timeLab;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel setLabelWithText:@"岁月的帆,在回忆的目光下渐行渐远......" fontSize:16 color:color_textOne];
    }
    return _contentLab;
}

- (UIImageView *)contentImageView {
    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"woquan-tu1"]];
    }
    return _contentImageView;
}

- (UIButton *)focusBtn {
    if (!_focusBtn) {
        _focusBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _focusBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_focusBtn setTitle:@"1" forState:(UIControlStateNormal)];
        [_focusBtn setTitleColor:color_textTwo forState:(UIControlStateNormal)];
        [_focusBtn setImage:[UIImage imageNamed:@"woquan-buai"] forState:(UIControlStateNormal)];
        [_focusBtn setImage:[UIImage imageNamed:@"woquan-ai"] forState:(UIControlStateSelected)];
        [_focusBtn addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _focusBtn;
}

- (UIButton *)replyBtn {
    if (!_replyBtn) {
        _replyBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _replyBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_replyBtn setTitle:@"回复" forState:(UIControlStateNormal)];
        [_replyBtn setTitleColor:color_textTwo forState:(UIControlStateNormal)];
        [_replyBtn setImage:[UIImage imageNamed:@"woquan-huifu"] forState:(UIControlStateNormal)];
        [_replyBtn addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _replyBtn;
}

- (void)action:(UIButton *)sender {
    sender.selected = !sender.selected;
    
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setSelectionStyle:(UITableViewCellSelectionStyleNone)];
        [self.contentView addSubview:self.picImageView];
        [self.contentView addSubview:self.nameLab];
        [self.contentView addSubview:self.timeLab];
        [self.contentView addSubview:self.contentLab];
        [self.contentView addSubview:self.contentImageView];
        [self.contentView addSubview:self.focusBtn];
        [self.contentView addSubview:self.replyBtn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    YXWeakSelf
    [_picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.top.equalTo(weakSelf.mas_top).offset(10);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_picImageView.mas_right).offset(5);
        make.top.equalTo(weakSelf.mas_top).offset(12);
        [_nameLab sizeToFit];
    }];
    
    [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_picImageView.mas_right).offset(5);
        make.top.equalTo(_nameLab.mas_bottom).offset(0);
        [_timeLab sizeToFit];
    }];
    
    [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.top.equalTo(_picImageView.mas_bottom).offset(10);
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        [_contentLab sizeToFit];
    }];
    
    [_contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.top.equalTo(_contentLab.mas_bottom).offset(10);
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        make.height.offset(200);
    }];
    
    [_replyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        make.top.equalTo(_contentImageView.mas_bottom).offset(10);
        [_replyBtn sizeToFit];
    }];
    
    [_focusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_replyBtn.mas_left).offset(-20);
        make.centerY.equalTo(_replyBtn.mas_centerY);
        [_focusBtn sizeToFit];
    }];
    
}


@end


@interface YXCircleDynamicCell1 ()

@property (nonatomic ,strong) UIImageView *userImageView;
@property (nonatomic ,strong) UILabel *userLab;
@property (nonatomic ,strong) UILabel *timeLab;
@property (nonatomic ,strong) UILabel *contentLab;
@property (nonatomic ,strong) UILabel *unitLab;
@property (nonatomic ,strong) UIButton *focusBtn;
@property (nonatomic ,strong) UIButton *replyBtn;
@end

@implementation YXCircleDynamicCell1

- (UIImageView *)userImageView {
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"woquan-rentou"]];
    }
    return _userImageView;
}

- (UILabel *)userLab {
    if (!_userLab) {
        _userLab = [UILabel setLabelWithText:@"大仙贝" fontSize:16 color:color_textOne];
    }
    return _userLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel setLabelWithText:@"5月以前" fontSize:12 color:color_textThree];
    }
    return  _timeLab;
}

- (UILabel *)unitLab {
    if (!_unitLab) {
        _unitLab = [UILabel setLabelWithText:@"" fontSize:18 color:color_textThree];
    }
    return _unitLab;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel setLabelWithText:@"美美哒^_^" fontSize:16 color:color_textOne];
    }
    return _contentLab;
}

- (UIButton *)focusBtn {
    if (!_focusBtn) {
        _focusBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _focusBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_focusBtn setTitle:@"1" forState:(UIControlStateNormal)];
        [_focusBtn setTitleColor:color_textTwo forState:(UIControlStateNormal)];
        [_focusBtn setImage:[UIImage imageNamed:@"woquan-buai"] forState:(UIControlStateNormal)];
        [_focusBtn setImage:[UIImage imageNamed:@"woquan-ai"] forState:(UIControlStateSelected)];
        [_focusBtn addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _focusBtn;
}

- (UIButton *)replyBtn {
    if (!_replyBtn) {
        _replyBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _replyBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_replyBtn setTitle:@"回复" forState:(UIControlStateNormal)];
        [_replyBtn setTitleColor:color_textTwo forState:(UIControlStateNormal)];
        [_replyBtn setImage:[UIImage imageNamed:@"woquan-huifu"] forState:(UIControlStateNormal)];
        [_replyBtn addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _replyBtn;
}
- (void)action:(UIButton *)sender {
    sender.selected = !sender.selected;
    
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.userImageView];
        [self.contentView addSubview:self.userLab];
        [self.contentView addSubview:self.timeLab];
        [self.contentView addSubview:self.unitLab];
        [self.contentView addSubview:self.contentLab];
        [self.contentView addSubview:self.focusBtn];
        [self.contentView addSubview:self.replyBtn];
    }
    return self;
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    YXWeakSelf
    [_userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.top.equalTo(weakSelf.mas_top).offset(10);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [_userLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_userImageView.mas_right).offset(5);
        make.top.equalTo(weakSelf.mas_top).offset(12);
        [_userLab sizeToFit];
    }];
    
    [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_userImageView.mas_right).offset(5);
        make.top.equalTo(_userLab.mas_bottom).offset(0);
        [_timeLab sizeToFit];
    }];
    
    [_unitLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_userImageView.mas_centerY);
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        [_userLab sizeToFit];
    }];
    
    [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_userImageView.mas_left).offset(5);
        make.top.equalTo(_timeLab.mas_bottom).offset(15);
        make.right.equalTo(weakSelf.mas_right).offset(-30);
        [_contentLab sizeToFit];
    }];
    
    [_replyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        make.top.equalTo(_contentLab.mas_bottom).offset(10);
        [_replyBtn sizeToFit];
    }];
    
    [_focusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_replyBtn.mas_left).offset(-20);
        make.centerY.equalTo(_replyBtn.mas_centerY);
        [_focusBtn sizeToFit];
    }];
    
}


@end










