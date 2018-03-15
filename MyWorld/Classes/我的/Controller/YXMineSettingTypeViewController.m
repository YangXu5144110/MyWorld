//
//  YXMineSettingTypeViewController.m
//  MyWorld
//
//  Created by 杨旭 on 2017/12/11.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXMineSettingTypeViewController.h"

@interface YXMineSettingTypeViewController ()<UITextViewDelegate>
@property (nonatomic ,strong) UILabel *placeholderLab;
@end

@implementation YXMineSettingTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = color_backColor;
    [self createLeftBarButtonItemWithImage:@"huiyuan-return"];
    
    switch (self.typeView) {
        case Setting_Password:
        {
            
        }
            break;
        case Setting_Notice:
        {
            
        }
            break;
        case Setting_Opinion:
        {
            [self createOpinionUI];
        }
            break;
        case Setting_About:
        {
            [self createAboutUI];
        }
            break;
        default:
            break;
    }
    
}

#pragma mark - 意见与反馈
- (void)createOpinionUI {
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[self getSendBtnRightItem]];

    UITextView *textView = [[UITextView alloc] initWithFrame:(CGRectMake(0, 15, kScreenWidth, 200))];
    textView.backgroundColor = [UIColor whiteColor];
    textView.font = [UIFont systemFontOfSize:16];
    textView.delegate = self;
    [self.view addSubview:textView];
    
    UILabel *textLab = [UILabel setLabelWithText:@"请在此处写您的建议或者问题" fontSize:16 color:color_textThree];
    textLab.frame = CGRectMake(10, 8, kScreenWidth - 20, 20);
    [textView addSubview:textLab];
    self.placeholderLab = textLab;
    
    
    UITextField *textFd = [[UITextField alloc] initWithFrame:(CGRectMake(0, textView.H + + textView.Y + 15, kScreenWidth, 50))];
    textFd.backgroundColor = [UIColor whiteColor];
    textFd.placeholder = @"请留下您的联系方式(微信号/QQ/邮箱)";
    [self.view addSubview:textFd];
}

- (UIButton *)getSendBtnRightItem {
    UIButton *sendBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    sendBtn.frame = CGRectMake(0, 0, 40, 30);
    [sendBtn setTitle:@"发送" forState:(UIControlStateNormal)];
    [sendBtn setTitleColor:color_textThree forState:(UIControlStateNormal)];
    return sendBtn;
}


#pragma mark - textView Delegate
-(BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    
    self.placeholderLab.text = nil;
    return YES;
}
-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    
    if (textView.text.length == 0) {
        self.placeholderLab.text = @"请在此处写您的建议或者问题";
    }
    [textView resignFirstResponder];
    [textView endEditing:YES];
    return YES;
}


#pragma mark - 关于
- (void)createAboutUI {
    
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chaoren_guanyuwomen"]];
    image.frame = CGRectMake((kScreenWidth - 110)/2, 200, 110, 110);
    [self.view addSubview:image];
    
    UILabel *textLab = [UILabel setLabelWithText:@"for iphone v1.0.0" fontSize:14 color:color_textTwo];
    textLab.frame = CGRectMake(0, image.H + image.Y+ 20, kScreenWidth, 20);
    textLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:textLab];
}


@end
