//
//  YXCustomTabBar.m
//  MyWorld
//
//  Created by 杨旭 on 2017/11/21.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXCustomTabBar.h"

@implementation YXCustomTabBar


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
//    UIButton *publishBtn = [[UIButton alloc] init];
//    [publishBtn setBackgroundImage:[UIImage imageNamed:@"myshijie"] forState:UIControlStateNormal];
//    [publishBtn addTarget:self action:@selector(didClickPublishBtn:) forControlEvents:UIControlEventTouchUpInside];
//    publishBtn.adjustsImageWhenHighlighted = NO;
//    publishBtn.size = publishBtn.currentBackgroundImage.size;
//    publishBtn.centerX = self.W / 2;
//    publishBtn.centerY = 10;
//    [self addSubview:publishBtn];

    self.publishBtn = [[UIButton alloc] init];
    [self.publishBtn setBackgroundImage:[UIImage imageNamed:@"myshijie"] forState:UIControlStateNormal];
    [self.publishBtn addTarget:self action:@selector(didClickPublishBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.publishBtn.adjustsImageWhenHighlighted = NO;
    self.publishBtn.size = self.publishBtn.currentBackgroundImage.size;
    self.publishBtn.centerX = self.W / 2;
    self.publishBtn.centerY = 10;
    [self addSubview:self.publishBtn];
    
    // 其他位置按钮
    NSUInteger count = self.subviews.count;
    for (NSUInteger i = 0 , j = 0; i < count; i++) {
        UIView *view = self.subviews[i];
        Class class = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:class]) {
            view.W = self.W / 5.0;
            view.X = self.W * j / 5.0;
            j++;
            if (j == 2) {
                j++;
            }
        }
    }
    
}

// 点击My世界
- (void) didClickPublishBtn:(UIButton *) sender {
    if (self.didClickPublishBtn) {
        self.didClickPublishBtn();
    }
}


//重写hitTest方法，去监听"+"按钮和“添加”标签的点击，目的是为了让凸出的部分点击也有反应
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    //这一个判断是关键，不判断的话push到其他页面，点击“+”按钮的位置也是会有反应的，这样就不好了
    //self.isHidden == NO 说明当前页面是有TabBar的，那么肯定是在根控制器页面
    //在根控制器页面，那么我们就需要判断手指点击的位置是否在“+”按钮或“添加”标签上
    //是的话让“+”按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
    if (self.isHidden == NO)
    {
        
        //将当前TabBar的触摸点转换坐标系，转换到“+”按钮的身上，生成一个新的点
        CGPoint newA = [self convertPoint:point toView:self.publishBtn];
        
        //判断如果这个新的点是在“+”按钮身上，那么处理点击事件最合适的view就是“+”按钮
        if ( [self.publishBtn pointInside:newA withEvent:event])
        {
            return self.publishBtn;
        }
    
        else
        {//如果点不在“+”按钮身上，直接让系统处理就可以了
            
            return [super hitTest:point withEvent:event];
        }
    }
    else
    {
        //TabBar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
        return [super hitTest:point withEvent:event];
    }
}
@end
