//
//  YXLoginView.m
//  MyWorld
//
//  Created by 杨旭 on 2017/11/20.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXLoginView.h"
#import "WSShiningLabel.h"
#import "YXInputView.h"
@interface YXLoginView ()<UITextFieldDelegate>
@property (nonatomic ,strong) UIImageView *backView;
@property (nonatomic ,strong) UIView *contentView;
@property (nonatomic ,strong) UIScrollView *scrollView;
@property (nonatomic ,strong) WSShiningLabel *slogan1;
@property (nonatomic ,strong) WSShiningLabel *slogan2;
@property (nonatomic ,strong) UIButton *loginBtn;
@property (nonatomic ,strong) UIButton *registBtn;
@property (nonatomic ,strong) UIButton *threeBtn;
@property (nonatomic ,strong) UIButton *forgetBtn;
@property (nonatomic ,strong) YXInputView *inputView;
@property (nonatomic ,strong) UIButton *termsBtn;
@property (nonatomic ,strong) NSArray *titleArr;
@property (nonatomic ,strong) NSArray *imageArr;
@end

@implementation YXLoginView


- (UIImageView *)backView {
    if (!_backView) {
        _backView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_bg"]];
        // 打开交互
        _backView.userInteractionEnabled = YES;
        
        // 添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [_backView addGestureRecognizer:tap];
        
        [self addSubview:self.backView];
        [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.offset(0);
        }];
    }
    return _backView;
}

- (void)tap {
     //点击背景取消输入框编辑状态
    [self.inputView.inputTextField resignFirstResponder];
}

- (WSShiningLabel *)slogan1 {
    if (!_slogan1) {
        _slogan1 = [[WSShiningLabel alloc] initWithFrame:(CGRectMake((kScreenWidth - 280)/ 2, 240 , 280, 30))];
        _slogan1.text = @"Welcome to my world !";
        _slogan1.textColor = [UIColor grayColor];
        _slogan1.font = [UIFont systemFontOfSize:26];
        [_slogan1 startShimmer];                 // 开启闪烁
        [self addSubview:_slogan1];

    }
    return _slogan1;
}

- (WSShiningLabel *)slogan2 {
    if (!_slogan2) {
        _slogan2 = [[WSShiningLabel alloc] initWithFrame:(CGRectMake((kScreenWidth - 100)/2, _slogan1.H + _slogan1.Y + 2, 100, 20))];
        _slogan2.text = @"这里只属于你";
        _slogan2.textColor = [UIColor grayColor];
        _slogan2.font = [UIFont systemFontOfSize:16];
        _slogan2.shimmerType = ST_RightToLeft;
        [_slogan2 startShimmer];                 // 开启闪烁
        [self addSubview:_slogan2];
    }
    return _slogan2;
}


- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _loginBtn.layer.masksToBounds = YES;
        _loginBtn.layer.cornerRadius = 20;
        _loginBtn.tag = 200;
        [_loginBtn setBackgroundColor:[UIColor redColor]];
        [_loginBtn setTitle:@"登 录" forState:(UIControlStateNormal)];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_loginBtn addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:_loginBtn];
        [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_inputView.mas_bottom).offset(10);
            make.left.equalTo(self.mas_left).offset(30);
            make.right.equalTo(self.mas_right).offset(-30);
            make.height.offset(46);
        }];
    }
    return _loginBtn;
}

- (UIButton *)registBtn {
    if (!_registBtn) {
        _registBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_registBtn setTitle:@"注册" forState:(UIControlStateNormal)];
        [_registBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        _registBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _registBtn.tag = 201;
        [_registBtn addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.registBtn];
        [_registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-30);
            make.top.equalTo(self.mas_top).offset(20);
            [_registBtn sizeToFit];
        }];
    }
    
    return _registBtn;
}


- (UIButton *)threeBtn {
    if (!_threeBtn) {
        _threeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _threeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_threeBtn setTitle:@"第三方登录" forState:(UIControlStateNormal)];
        _threeBtn.tag = 202;
        [_threeBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_threeBtn addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.threeBtn];
        [_threeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(30);
            make.bottom.equalTo(self.mas_bottom).offset(-20);
            [_threeBtn sizeToFit];
        }];
    }
    return _threeBtn;
}

- (UIButton *)forgetBtn {
    if (!_forgetBtn) {
        _forgetBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _forgetBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_forgetBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_forgetBtn setTitle:@"忘记密码？" forState:(UIControlStateNormal)];
        _forgetBtn.tag = 203;
        [_forgetBtn addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.forgetBtn];
        [_forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-30);
            make.bottom.equalTo(self.mas_bottom).offset(-20);
            [_forgetBtn sizeToFit];
        }];

    }
    return _forgetBtn;
}

- (UIButton *)termsBtn {
    if (!_termsBtn) {
        _termsBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_termsBtn setTitle:@"已阅读并同意使用条款和隐私政策" forState:(UIControlStateNormal)];
        [_termsBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_termsBtn setImage:[UIImage imageNamed:@"regis-xuanze"] forState:(UIControlStateNormal)];
        _termsBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:self.termsBtn];
        [_termsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.top.equalTo(_loginBtn.mas_bottom).offset(10);
        }];
    }
    return _termsBtn;
}


- (void)action:(UIButton *)sender {
    self.loginBtnTypeClickBlock(sender.tag - 200);
}

- (void)setTitle:(NSString *)title {
    _title = title;
    [self.registBtn setTitle:title forState:(UIControlStateNormal)];
    [self.loginBtn setTitle:@"注 册" forState:(UIControlStateNormal)];
}


- (instancetype)initWithFrame:(CGRect)frame andWithTypeView:(YXLoginViewType)type
{
    self = [super initWithFrame:frame];
    if (self) {
        self.type = type;
        [self showWithTypeView:type];

    }
    return self;
}
- (void)showWithTypeView:(YXLoginViewType)type {
    [self backView];
    [self registBtn];
    if (type == ViewType_LoginView) {
        self.contentView = [[UIView alloc] initWithFrame:(CGRectMake(0, 400, kScreenWidth, 110))];
        [self addSubview:self.contentView];
        
        self.imageArr = @[@"login_phone",@"login_pwd"];
        self.titleArr = @[@"手机号",@"登录密码"];
        for (int i = 0; i < _titleArr.count; i ++ ) {
            YXInputView * inputView = [[YXInputView alloc] initWithFrame:(CGRectMake(30, 55 *i, kScreenWidth - 60, 46))];
            inputView.leftImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",_imageArr[i]]];
            inputView.inputTextField.placeholder = _titleArr[i];
            inputView.inputTextField.delegate = self;
            inputView.inputTextField.tag = 1000 + i;
            [self.contentView addSubview:inputView];
            self.inputView = inputView;
            
        }
        [self slogan1];
        [self slogan2];
        [self loginBtn];
        [self threeBtn];
        [self forgetBtn];
        
    }else if (type == ViewType_RegistView){
        self.scrollView = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, 232, kScreenWidth, 55 * 5 ))];
        [self addSubview:self.scrollView];
        
        self.imageArr = @[@"rigis-shouji",@"regis-yanzhengma",@"regis-mima",@"regis-shenfenzheng",@"regis-nianling"];
        self.titleArr = @[@"手机号",@"验证码",@"登录密码",@"请输入您的身份证号码",@"对外宣称年龄"];
        for (int i = 0; i < _titleArr.count; i ++ ) {
            YXInputView * inputView = [[YXInputView alloc] initWithFrame:(CGRectMake(30, 55 *i, kScreenWidth - 60, 46))];
            inputView.leftImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",_imageArr[i]]];
            inputView.inputTextField.placeholder = _titleArr[i];
            inputView.inputTextField.delegate = self;
            inputView.inputTextField.tag = 2000 + i;
            [self.scrollView addSubview:inputView];
            self.inputView = inputView;
            
        }
        [self loginBtn];
        [self termsBtn];
    }
  
}



#pragma mark - TextField代理方法 -
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    return [textField resignFirstResponder];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField {

    // 让contentView上移, 防止键盘遮挡输入框
    if (self.type == ViewType_LoginView) {
        CGRect rect = self.contentView.frame;
        rect.origin.y = 300;
        self.contentView.frame = rect;
    }else if (self.type == ViewType_RegistView) {
        NSInteger index = textField.tag - 2000;
        if (index >= 2) {
            CGRect rect = self.scrollView.frame;
            rect.origin.y = 232 - (index-1) * 55;
            self.scrollView.frame = rect;
        }
    
    }
    
}
// 输入结束, 键盘回收时, 下移contentView的内容视图
-(void)textFieldDidEndEditing:(UITextField *)textField {
    
    NSLog(@"%@",textField.text);
    if (self.type == ViewType_LoginView) {
        CGRect rect = self.contentView.frame;
        rect.origin.y = 400;
        self.contentView.frame = rect;
    }else if (self.type == ViewType_RegistView) {
        CGRect rect = self.scrollView.frame;
        rect.origin.y = 232;
        self.scrollView.frame = rect;
    }
    


}


@end
