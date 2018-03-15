//
//  BaseViewController.m
//  LearnToHelp
//
//  Created by 杨旭 on 2017/11/6.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"tongxun-bg"] forBarMetrics:0];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController.navigationBar setBarTintColor:color_globalColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor] ,NSForegroundColorAttributeName :[UIFont systemFontOfSize:18.0f]}];

}


-(void)showAlertWith:(NSString *)messge {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:messge message:@"" preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *alert = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertController addAction:alert];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

-(void)showAlertWithTitle:(NSString *)title {
    

    
}



/** 请求数据 */
- (void)requestData{
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    if ([self isViewLoaded] == YES && self.view.window == nil) {
        self.view = nil;
    }
    
}


/** 左侧  右侧按钮带标题初始化方法 */
- (void)createLeftBarButtonItemWithImage:(NSString *)leftImage andRightImage:(NSString *)rightImage {
    
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 20, 20, 20);
    self.leftBarButton = leftBtn;
    //    [leftBtn setImage:[UIImage imageNamed:leftImage] forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:leftImage] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBarBtnItemAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn addTarget:self action:@selector(rightBarBtnItemAction) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.frame = CGRectMake(kScreenWidth - 40, 20, 20, 20);
    [rightBtn setBackgroundImage:[UIImage imageNamed:rightImage] forState:UIControlStateNormal];
    //    [rightBtn setImage:[UIImage imageNamed:rightImage] forState:UIControlStateNormal];
    self.rightBarButton = rightBtn;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
}
/** 右侧按钮调用 */
- (void)rightBarBtnItemAction {
    [self.navigationController popViewControllerAnimated:YES];
}
/** 左侧按钮调用 */
- (void)leftBarBtnItemAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)createLeftBarButtonItemWithImage:(NSString *)leftImage {
    
    self.navigationController.navigationBar.barTintColor = [UIColor py_colorWithHexString:@"#00685F" alpha:1];
    //设置文字样式
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{
       NSFontAttributeName:kFont(18.0),
       NSForegroundColorAttributeName:[UIColor py_colorWithHexString:@"#ffffff"]
       }
     ];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 20, 25, 40);
    [leftBtn setImage:[UIImage imageNamed:leftImage] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBarBtnItemAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.selected = NO;
    self.rightBarButton = rightBtn;
    [rightBtn addTarget:self action:@selector(rightBarBtnItemAction:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.frame = CGRectMake(kScreenWidth - 50, 20, 40, 40);
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    rightBtn.contentMode = UIViewContentModeRight;
    [rightBtn setTitle:self.rightTitle forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor py_colorWithHexString:@"#5f3100"] forState:UIControlStateNormal];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
}

- (void)createWhiteNarBackgroundLeftBarWithImage:(NSString *)leftImage {

    self.navigationController.navigationBar.barTintColor = [UIColor py_colorWithHexString:@"#ffffff" alpha:1];
    //设置文字样式
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{
       NSFontAttributeName:kFont(18.0),
       NSForegroundColorAttributeName:[UIColor blackColor]
       }
     ];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 20, 25, 40);
    [leftBtn setImage:[UIImage imageNamed:leftImage] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
}

- (void)setRightColor:(UIColor *)rightColor {
    [self.rightBarButton setTitleColor:rightColor forState:UIControlStateNormal];
}

- (void)setRightTitle:(NSString *)rightTitle {
    [self.rightBarButton setTitle:rightTitle forState:UIControlStateNormal];
}

/** 右侧按钮调用 */
- (void)rightBarBtnItemAction:(UIButton*)sender {
    
}

/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:    虚线的间距
 ** lineColor:      虚线的颜色
 **/
- (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor {
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];     [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}

#pragma mark -- 调取MD5加密
- (NSString *)passwordToMD5:(NSString *)password{
    const char *cStr = [password UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++){
        [output appendFormat:@"%02x", digest[i]];
    }
    output = [output uppercaseString].copy;
    return output;
}

#pragma mark - 判断手机号
- (NSString *)valiMobile:(NSString *)mobile{
    if (mobile.length != 11){
        return @"手机号长度只能是11位";
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return nil;
        }else{
            return @"请输入正确的手机号码";
        }
    }
    return nil;
}


@end
