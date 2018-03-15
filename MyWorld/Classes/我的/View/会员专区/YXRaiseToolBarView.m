//
//  YXRaiseToolBarView.m
//  MyWorld
//
//  Created by 杨旭 on 2017/12/11.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXRaiseToolBarView.h"

@interface YXRaiseToolBarView ()
@property (strong, nonatomic)  UIButton *collectionBtn;
@property (strong, nonatomic)  UIButton *shoppingBtn;
@property (strong, nonatomic)  UIButton *supportBtn;

@end

@implementation YXRaiseToolBarView

- (UIButton *)collectionBtn {
    if (!_collectionBtn) {
        _collectionBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_collectionBtn setTitle:@"收藏" forState:(UIControlStateNormal)];
        [_collectionBtn setTitleColor:color_textTwo forState:(UIControlStateNormal)];
        [_collectionBtn setImage:[UIImage imageNamed:@"zhong-shoucang"] forState:(UIControlStateNormal)];
        _collectionBtn.tag = 1000;
        _collectionBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _collectionBtn.backgroundColor = [UIColor py_colorWithHexString:@"#f2f2f2"];
        [_collectionBtn setImgViewStyle:(ButtonImgViewStyleTop) imageSize:(CGSizeMake(20, 18)) space:2];
        [_collectionBtn addTarget:self action:@selector(clickBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _collectionBtn;
}
- (UIButton *)shoppingBtn {
    if (!_shoppingBtn) {
        _shoppingBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _shoppingBtn.backgroundColor = [UIColor py_colorWithHexString:@"#f2f2f2"];
        [_shoppingBtn setImage:[UIImage imageNamed:@"shop-car"] forState:(UIControlStateNormal)];
        [_shoppingBtn setTitle:@"购物车" forState:(UIControlStateNormal)];
        [_shoppingBtn setTitleColor:color_textTwo forState:(UIControlStateNormal)];
        _shoppingBtn.tag = 1001;
        _shoppingBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_shoppingBtn setImgViewStyle:(ButtonImgViewStyleTop) imageSize:(CGSizeMake(20, 18)) space:2];
        [_shoppingBtn addTarget:self action:@selector(clickBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _shoppingBtn;
}

- (UIButton *)supportBtn {
    if (!_supportBtn) {
        _supportBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _supportBtn.backgroundColor = [UIColor py_colorWithHexString:@"#C53A40"];
        [_supportBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_supportBtn setTitle:@"支持项目" forState:(UIControlStateNormal)];
        _supportBtn.tag = 1002;
        [_supportBtn addTarget:self action:@selector(clickBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _supportBtn;
}
- (void)clickBtnAction:(UIButton *)sender {
    if (self.selectBtnClickBlock) {
        self.selectBtnClickBlock(sender.tag - 1000);
    }
    
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
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.collectionBtn];
    [self addSubview:self.shoppingBtn];
    [self addSubview:self.supportBtn];
}



- (void)layoutSubviews {
    [super layoutSubviews];
    YXWeakSelf
    [_collectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(0);
        make.top.equalTo(weakSelf.mas_top).offset(0);
        make.size.mas_equalTo(CGSizeMake(80, 50));
    }];
    
    [_shoppingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.collectionBtn.mas_right).offset(1);
        make.top.equalTo(weakSelf.mas_top).offset(0);
        make.size.mas_equalTo(CGSizeMake(80, 50));
    }];
    
    [_supportBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.shoppingBtn.mas_right).offset(0);
        make.right.equalTo(weakSelf.mas_right).offset(0);
        make.top.equalTo(weakSelf.mas_top).offset(0);
        make.height.offset(50);
    }];
}

@end
