//
//  YXMineRankingViewCell.m
//  MyWorld
//
//  Created by 杨旭 on 2017/11/21.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXMineRankingViewCell.h"

@interface YXMineRankingViewCell ()

@end

@implementation YXMineRankingViewCell

- (UIImageView *)levelImageView {
    if (!_levelImageView) {
        _levelImageView = [UIImageView new];
    }
    return _levelImageView;
}

- (UILabel *)levelLab {
    if (!_levelLab) {
        _levelLab = [UILabel setLabelWithText:@"" fontSize:12 color:color_textThree];
    }
    return _levelLab;
}

- (UIImageView *)userImageView {
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"huiyuan-rentou"]];
    }
    return _userImageView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel setLabelWithText:@"果冻" fontSize:16 color:color_textTwo];
    }
    return _nameLab;
}
- (UILabel *)numberLab {
    if (!_numberLab) {
        _numberLab = [UILabel setLabelWithText:@"11111" fontSize:16 color:color_textTwo];
    }
    return _numberLab;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = color_lineColor;
    }
    return _lineView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.levelImageView];
        [self.contentView addSubview:self.levelLab];
        [self.contentView addSubview:self.userImageView];
        [self.contentView addSubview:self.nameLab];
        [self.contentView addSubview:self.numberLab];
        [self.contentView addSubview:self.lineView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    YXWeakSelf
    [_levelImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(20);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_levelLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(_levelImageView.mas_right).offset(5);
        [_levelLab sizeToFit];
    }];
    
    [_userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.right.equalTo(weakSelf.mas_centerX).offset(-10);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(_userImageView.mas_right).offset(10);
        [_nameLab sizeToFit];
    }];
    
    [_numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        [_numberLab sizeToFit];
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.mas_bottom).offset(0);
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 0.5));
    }];
}

@end
