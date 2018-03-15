//
//  YXMineRankingView.m
//  MyWorld
//
//  Created by 杨旭 on 2017/11/21.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXMineRankingView.h"

@interface YXMineRankingView ()
@property (strong, nonatomic) IBOutlet UIButton *nationalBtn;
@property (strong, nonatomic) IBOutlet UIButton *localBtn;

@end

@implementation YXMineRankingView

-(instancetype)initWithFrame:(CGRect)frame withDataArray:(NSArray *)dataArray{
    
    if (self = [super initWithFrame:frame]) {
        // 从xib中找到我们定义的view
        NSArray *viewArray = [[NSBundle mainBundle]loadNibNamed:@"YXMineRankingView" owner:self options:nil];
        self = viewArray[0];
        self.frame = frame;
        
        [self createBtnUI];
    }
    return self;
    
}

- (void)createBtnUI {
    
    NSArray *titleArr = @[@"分享",@"提现",@"充值"];
    NSArray *imageArr = @[@"huiyuan-fenxiang",@"huiyuan-tixian",@"huiyuan-chongzhi"];
    for (int i = 0 ; i < titleArr.count; i ++) {
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        btn.frame = CGRectMake(self.frame.size.width - 60 - 60 * i , 40, 40, 40);
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitle:titleArr[i] forState:(UIControlStateNormal)];
        [btn setTitleColor:color_textTwo forState:(UIControlStateNormal)];
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",imageArr[i]]] forState:(UIControlStateNormal)];
        [btn setImgViewStyle:(ButtonImgViewStyleTop) imageSize:(CGSizeMake(24, 24)) space:5];
        [self addSubview:btn];
    }
    
    self.nationalBtn.layer.masksToBounds = YES;
    self.nationalBtn.layer.cornerRadius = 3.0f;
    self.nationalBtn.layer.borderWidth = 1.0f;
    self.nationalBtn.layer.borderColor = [UIColor redColor].CGColor;
    self.localBtn.layer.masksToBounds = YES;
    self.localBtn.layer.cornerRadius = 3.0f;
    self.localBtn.layer.borderWidth = 1.0f;
    self.localBtn.layer.borderColor = [UIColor redColor].CGColor;
    
}

- (IBAction)rankingBtnAction:(UIButton *)sender {
    if (sender == self.nationalBtn) {
        self.localBtn.selected = NO;
        self.nationalBtn.selected = YES;
        self.localBtn.backgroundColor = [UIColor whiteColor];
        [self.localBtn setTitleColor:color_textTwo forState:(UIControlStateNormal)];
        self.nationalBtn.backgroundColor = [UIColor redColor];
        [self.nationalBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    }else {
        self.nationalBtn.selected = NO;
        self.localBtn.selected = YES;
        self.localBtn.backgroundColor = [UIColor redColor];
        [self.localBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        self.nationalBtn.backgroundColor = [UIColor whiteColor];
        [self.nationalBtn setTitleColor:color_textTwo forState:(UIControlStateNormal)];
    }
    
    
}


@end
