//
//  YXLoveFieldView.m
//  MyWorld
//
//  Created by 杨旭 on 2017/11/23.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXLoveFieldView.h"

@interface YXLoveFieldView ()
@property (nonatomic ,strong) NSArray *titleArr;
@end

@implementation YXLoveFieldView

- (NSArray *)titleArr {
    if (!_titleArr) {
        _titleArr = @[@"投资",@"理财",@"吃货",@"正直",@"旅游",@"看书",@"睡觉",@"败家",@"桑拿",@"运动",@"学生",@"白领",@"游戏",@"低调",@"企业家",@"女汉子"];
    }
    return _titleArr;
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
    
    int totalloc = 4;
    CGFloat btnw = 74;
    CGFloat btnh = 74;
//    CGFloat margin = 12;
    
    if (kScreenWidth == 414) {
        btnw = 78;
        btnh = 78;
//        margin = 18;
    }
    
    CGFloat margin=(self.frame.size.width-totalloc*btnw)/(totalloc+1);

    
    for (int i = 0 ; i < self.titleArr.count; i ++) {
 
        int row = i/totalloc;
        int loc = i%totalloc;
        
        CGFloat btnx = margin + (margin + btnw)*loc;
        CGFloat btny = margin + (margin + btnh)*row;
        
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        btn.frame = CGRectMake(btnx, 60 + btny, btnw, btnh);
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = btn.frame.size.width / 2;
        btn.layer.borderColor = color_lineColor.CGColor;
        btn.layer.borderWidth = 1;
        btn.tag = i + 300;
        [btn setTitle:self.titleArr[i] forState:(UIControlStateNormal)];
        [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [btn addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:btn];
        
    }
    
}

- (void)action:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (!sender.selected) {
        [sender setBackgroundColor:[UIColor whiteColor]];
        [sender setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    }else {
        [sender setBackgroundColor:[UIColor randomColor]];
        [sender setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];

    }
 }



@end
