//
//  YXInputView.m
//  MyWorld
//
//  Created by 杨旭 on 2017/11/20.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXInputView.h"

@interface YXInputView ()

@end

@implementation YXInputView

- (UIImageView *)leftImage {
    if (!_leftImage) {
        _leftImage = [UIImageView new];
        [self addSubview:self.leftImage];
        [_leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(20);
            make.centerY.equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(15, 20));
        }];
    }
    return _leftImage;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_leftImage.mas_right).offset(20);
            make.centerY.equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(1, 20));
        }];
    }
    return _lineView;
}

- (UITextField *)inputTextField {
    if (!_inputTextField) {
        _inputTextField = [[UITextField alloc] init];
        
        [self addSubview:self.inputTextField];
        [_inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_lineView.mas_right).offset(20);
            make.centerY.equalTo(self.mas_centerY);
            make.right.equalTo(self.mas_right).offset(-20);
            [_inputTextField sizeToFit];
        }];
    }
    return _inputTextField;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor py_colorWithHexString:@"#FFFFFF" alpha:0.5];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 4;
        [self leftImage];
        [self lineView];
        [self inputTextField];
    }
    return self;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.inputTextField becomeFirstResponder];
    
}

@end
