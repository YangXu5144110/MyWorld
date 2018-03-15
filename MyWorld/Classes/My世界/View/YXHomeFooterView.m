//
//  YXHomeFooterView.m
//  MyWorld
//
//  Created by 杨旭 on 2017/11/23.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXHomeFooterView.h"

@interface YXHomeFooterView ()


@property (weak, nonatomic) IBOutlet UIView *iconFooterView;

@end

@implementation YXHomeFooterView

-(instancetype)initWithFrame:(CGRect)frame withDataArray:(NSArray *)dataArray{
    
    if (self = [super initWithFrame:frame]) {
        // 从xib中找到我们定义的view
        NSArray *viewArray = [[NSBundle mainBundle]loadNibNamed:@"YXHomeFooterView" owner:self options:nil];
        self = viewArray[0];
        self.frame = frame;
        
        [self createBtnUI];
    }
    return self;
    
}

- (void)createBtnUI {
    
    
    for (int i = 0 ; i < 4; i ++ ) {
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        btn.frame = CGRectMake(200 + 40 * i, 5 , 30, 30);
        [btn setImage:[UIImage imageNamed:@"touxiang1"] forState:(UIControlStateNormal)];
        [self.iconFooterView addSubview:btn];
        
    }
}

@end
