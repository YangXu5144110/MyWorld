//
//  YXRaiseChoseView.m
//  MyWorld
//
//  Created by 杨旭 on 2017/12/11.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXRaiseChoseView.h"
#import "YXCustomBtn.h"
@interface YXRaiseChoseView ()
@property (nonatomic ,strong) UIView *backView;
@property (nonatomic ,strong) UIImageView *picImageView;
@property (nonatomic ,strong) UIButton *closeBtn;
@property (nonatomic ,strong) UILabel *peopleLab;
@property (nonatomic ,strong) UILabel *priceLab;
@property (nonatomic ,strong) UILabel *contentLab;
@property (nonatomic ,strong) UIView *lineView;
@property (nonatomic ,strong) YXCustomBtn *customBtn1;
@property (nonatomic ,strong) YXCustomBtn *customBtn2;
@property (nonatomic ,strong) UIView *lineView1;
@property (nonatomic ,strong) UILabel *specificationLab;
@property (nonatomic ,strong) UIButton *btn1;
@property (nonatomic ,strong) UIButton *btn2;
@property (nonatomic ,strong) UIButton *supportBtn;
@end
@implementation YXRaiseChoseView

- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:(CGRectMake(0, kScreenHeight - 360, kScreenWidth, 360))];
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}

- (UIImageView *)picImageView {
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhong-backbg"]];
    }
    return _picImageView;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_closeBtn setImage:[UIImage imageNamed:@"round_close"] forState:(UIControlStateNormal)];
    }
    return _closeBtn;
}


- (UILabel *)peopleLab {
    if (!_peopleLab) {
        _peopleLab = [UILabel setLabelWithText:@"999人支持" fontSize:16 color:color_textOne];
    }
    return _peopleLab;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel setLabelWithText:@"¥500" fontSize:16 color:color_textOne];
    }
    return _priceLab;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel setLabelWithText:@"伸手即出，泡沫绵密丰富，芳香滋润，高效除菌" fontSize:16 color:color_textOne];
        _contentLab.numberOfLines = 2;
        _contentLab.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return _contentLab;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = color_lineColor;
    }
    return _lineView;
}

- (YXCustomBtn *)customBtn1 {
    if (!_customBtn1) {
        _customBtn1 = [[YXCustomBtn alloc] initWithFrame:CGRectZero title:@"全款支持" content:@"89元"];
        _customBtn1.layer.borderColor = [UIColor redColor].CGColor;
    }
    return _customBtn1;
}

- (YXCustomBtn *)customBtn2 {
    if (!_customBtn2) {
        _customBtn2 = [[YXCustomBtn alloc] initWithFrame:CGRectZero title:@"一元支持" content:@"1元"];
    }
    return _customBtn2;
}


- (UIView *)lineView1 {
    if (!_lineView1) {
        _lineView1 = [UIView new];
        _lineView1.backgroundColor = color_lineColor;
}
    return _lineView1;
}

- (UILabel *)specificationLab {
    if (!_specificationLab) {
        _specificationLab = [UILabel setLabelWithText:@"规格" fontSize:15 color:color_textOne];
    }
    return _specificationLab;
}

- (UIButton *)btn1 {
    if (!_btn1) {
        _btn1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_btn1 setTitle:@"单个装" forState:(UIControlStateNormal)];
        [_btn1 setTitleColor:color_textOne forState:(UIControlStateNormal)];
        _btn1.titleLabel.font = [UIFont systemFontOfSize:15];
        _btn1.layer.masksToBounds = YES;
        _btn1.layer.cornerRadius = 4.0f;
        _btn1.layer.borderColor = [UIColor redColor].CGColor;
        _btn1.layer.borderWidth = 1.0f;
    }
    return _btn1;
}

- (UIButton *)btn2 {
    if (!_btn2) {
        _btn2 = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_btn2 setTitle:@"5个装" forState:(UIControlStateNormal)];
        [_btn2 setTitleColor:color_textOne forState:(UIControlStateNormal)];
        _btn2.titleLabel.font = [UIFont systemFontOfSize:15];
        _btn2.layer.masksToBounds = YES;
        _btn2.layer.cornerRadius = 4.0f;
        _btn2.layer.borderColor = [UIColor blackColor].CGColor;
        _btn2.layer.borderWidth = 1.0f;
    }
    return _btn2;
}


- (UIButton *)supportBtn {
    if (!_supportBtn) {
        _supportBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _supportBtn.backgroundColor = [UIColor redColor];
        [_supportBtn setTitle:@"立即支持" forState:(UIControlStateNormal)];
        [_supportBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    }
    return _supportBtn;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
         self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        [self setup];
    }
    return self;
}

- (void)setup {
    
    [self addSubview:self.backView];
    [self.backView addSubview:self.picImageView];
    [self.backView addSubview:self.closeBtn];
    [self.backView addSubview:self.peopleLab];
    [self.backView addSubview:self.priceLab];
    [self.backView addSubview:self.contentLab];
    [self.backView addSubview:self.lineView];
    [self.backView addSubview:self.customBtn1];
    [self.backView addSubview:self.customBtn2];
    [self.backView addSubview:self.lineView1];
    [self.backView addSubview:self.specificationLab];
    [self.backView addSubview:self.btn1];
    [self.backView addSubview:self.btn2];
    [self.backView addSubview:self.supportBtn];
    
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    YXWeakSelf
    [_picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.backView.mas_left).offset(15);
        make.top.equalTo(weakSelf.backView.mas_top).offset(10);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.backView.mas_right).offset(-10);
        make.top.equalTo(weakSelf.backView.mas_top).offset(15);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_peopleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.picImageView.mas_right).offset(20);
        make.top.equalTo(weakSelf.backView.mas_top).offset(15);
        [_peopleLab sizeToFit];
    }];
    
    [_priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.picImageView.mas_right).offset(20);
        make.top.equalTo(weakSelf.peopleLab.mas_bottom).offset(5);
        [_priceLab sizeToFit];
    }];
    
    [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.priceLab.mas_bottom).offset(5);
        make.left.equalTo(weakSelf.picImageView.mas_right).offset(20);
        make.right.equalTo(weakSelf.backView.mas_right).offset(-20);
        [_contentLab sizeToFit];
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.picImageView.mas_bottom).offset(2);
        make.left.equalTo(weakSelf.backView.mas_left).offset(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1));
    }];
    
    [_customBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.backView.mas_left).offset(30);
        make.top.equalTo(weakSelf.lineView.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(80, 60));
    }];
    
    [_customBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.customBtn1.mas_centerY);
        make.left.equalTo(weakSelf.customBtn1.mas_right).offset(35);
        make.size.mas_equalTo(CGSizeMake(80, 60));
    }];
    
    [_lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(0);
        make.top.equalTo(weakSelf.customBtn1.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1));
    }];
    
    [_specificationLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.backView.mas_left).offset(30);
        make.top.equalTo(weakSelf.lineView1.mas_bottom).offset(20);
        [_specificationLab sizeToFit];
    }];
    
    [_btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.backView.mas_left).offset(35);
        make.top.equalTo(weakSelf.specificationLab.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    
    [_btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.btn1.mas_right).offset(20);
        make.centerY.equalTo(weakSelf.btn1.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    
    [_supportBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.backView.mas_left).offset(0);
        make.bottom.equalTo(weakSelf.backView.mas_bottom).offset(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 50));
    }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    }];
}

@end
