//
//  YXTabBarViewController.m
//  MyWorld
//
//  Created by 杨旭 on 2017/11/21.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXTabBarViewController.h"
#import "YXHomeViewController.h"
#import "YXCircleViewController.h"
#import "YXPetViewController.h"
#import "YXContactsViewController.h"
#import "YXMineViewController.h"
#import "YXCustomTabBar.h"
@interface YXTabBarViewController ()<UITabBarControllerDelegate>
//@property (nonatomic ,strong) YXCustomTabBar *customTabBar;
@property (nonatomic ,strong) YXHomeViewController *homeVC;
@property (nonatomic ,strong) UIImageView *picImageView;
@end

@implementation YXTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    
    //添加子控制器
    @autoreleasepool {

        
        [self addChildViewController:[[YXCircleViewController alloc] init] withImage:[UIImage imageNamed:@"wodequan-bian"] selectedImage:[UIImage imageNamed:@"wodequan-tian"] withTittle:@"我的圈圈"];
        
        [self addChildViewController:[[YXPetViewController alloc] init] withImage:[UIImage imageNamed:@"chongwu-bian"] selectedImage:[UIImage imageNamed:@"chongwu-tian"] withTittle:@"领养宠物"];
        
         [self addChildViewController:[[YXHomeViewController alloc] init] withImage:[UIImage imageNamed:@"myshijie"] selectedImage:[UIImage imageNamed:@"myshijie"] withTittle:nil];
        
        [self addChildViewController:[[YXContactsViewController alloc] init] withImage:[UIImage imageNamed:@"tongxunlu-bian"] selectedImage:[UIImage imageNamed:@"tongxunlu-tian"] withTittle:@"通讯录"];
        
        [self addChildViewController:[[YXMineViewController alloc] init] withImage:[UIImage imageNamed:@"wode-bian"] selectedImage:[UIImage imageNamed:@"wode-tian"] withTittle:@"我的"];
        
        
        self.selectedIndex = 2;
        
      
    }

}

/**
 *  初始化子控制器
 */
- (void)addChildViewController:(UIViewController *)controller withImage:(UIImage *)image selectedImage:(UIImage *)selectImage withTittle:(NSString *)tittle{
    
    @autoreleasepool {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
        
        //设置背景颜色
        [nav.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        nav.navigationBar.translucent=NO;
        nav.navigationBar.barTintColor = [UIColor py_colorWithHexString:@"#FFD02E" alpha:1];
        
        //设置文字样式
        [nav.navigationBar setTitleTextAttributes:
         @{
           NSFontAttributeName:kFont(20.0),
           NSForegroundColorAttributeName:[UIColor py_colorWithHexString:@"#5F3100"]
           }
         ];
        
    
        image=[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        selectImage=[selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [nav.tabBarItem setImage:image];
        [nav.tabBarItem setSelectedImage:selectImage];
        controller.title = tittle;
     
        
        //修改中间的tabBar图片的位置
        if (tittle == nil) {
            nav.tabBarItem.imageInsets = UIEdgeInsetsMake(-10, 0, 10, 0);
            UIImage *image = nav.tabBarItem.image;
            NSLog(@"%@",image);
//            self.picImageView.image = image;
//            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
//            [self.picImageView addGestureRecognizer:tap];
            
            CGPoint point = {image.size.height,image.size.width};
//            CGPoint newPoint = [self.tabBar convertPoint:point toView:nav.tabBarItem.image];
            
            NSLog(@"%@",NSStringFromCGPoint(point));
            
            
        }
        
      
        [nav.tabBarItem setTitleTextAttributes:@{
                                                 NSForegroundColorAttributeName:[UIColor py_colorWithHexString:@"#ED4639"]} forState:UIControlStateSelected];
        [nav.tabBarItem setTitleTextAttributes:@{
                                                 NSForegroundColorAttributeName:[UIColor py_colorWithHexString:@"#999999"]} forState:UIControlStateNormal];
        nav.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
        nav.tabBarItem.title = tittle;
        [self addChildViewController:nav];
        
        
        
    }
    
}

- (void)tapAction:(UITapGestureRecognizer *)sender {

    NSLog(@"xxxxx");
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView * view = [self hitTest:point withEvent:event];
    if (view == nil) {
        // 转换坐标系
        CGPoint newPoint = [self.tabBar convertPoint:point toView:self.picImageView];
        // 判断触摸点是否在button上
        if (CGRectContainsPoint(self.picImageView.bounds, newPoint)) {
            view = self.picImageView;
        }
    }
    return view;
}



#pragma mark - 实现UItabBarControllerDelegate中的方法
// 触发时机: 将要选中某个视图控制器是触发,返回YES代表可以被选中,返回值NO,代表不能被选中
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    NSLog(@"将要选中视图控制器");
    return YES;
    
}
// 触发时机: 选中视图控制器的时候触发
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    viewController.tabBarItem.badgeValue = nil;
    NSLog(@"已经选中视图控制器");
}



@end
