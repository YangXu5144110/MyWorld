//
//  HeaderURL.h
//  MyWorld
//
//  Created by 杨旭 on 2017/11/20.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#ifndef HeaderURL_h
#define HeaderURL_h

#define YXWeakSelf __weak typeof(self) weakSelf = self;

#define isIPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#pragma mark ---- 颜色
#define KRGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define KRGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

// 定义字体类型
#define text_TextName [UIFont fontWithName:@"MicrosoftYaHei" size:fontSize]
//屏幕的宽度
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
//屏幕的高度
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height


//适配
#define RateSize(x,y,w,h) CGRectMake((x) / 375.0 * kScreenWidth , (y) /667.0 * kScreenHeight, (w) / 375.0 * kScreenWidth, (h) /667.0  * kScreenHeight)
#define autFont(a) (a / 375.0 * kScreenWidth)

// 打印
#if DEBUG

#define NSLog(FORMAT, ...) fprintf(stderr,"[%s:%d行] %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#else

#define NSLog(FORMAT, ...) nil

#endif

// App根视图
#define AppRootViewController  [UIApplication sharedApplication].keyWindow.rootViewController

#define IS_IOS_7    floorf([[UIDevice currentDevice].systemVersion floatValue]) ==7.0 ? 1 : 0

#define IS_IOS_10    floorf([[UIDevice currentDevice].systemVersion floatValue]) == 10.0 ? 1 : 0

#define kFont(s) [UIFont systemFontOfSize:(kScreenWidth >= 375 ? s: s-2.0)]
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

// 判断是否为iPhone 6Plus/6sPlus
#define iPhone6Plus_6sPlus [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f
//  iPhone X尺寸
#define iPhoneX [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 812.0f


// tabBar高度
#define kTabBarHeight    49

// narBar高度
#define kNarBarHeight   iPhoneX ? 88.0f : 64.0f


// 定义全局颜色
#define color_globalColor [UIColor py_colorWithHexString:@"#00685F"]

// 定义标题颜色
#define color_titleColor [UIColor py_colorWithHexString:@"#5f3100"]

// 定义全局背景色
#define color_backColor [UIColor py_colorWithHexString:@"#f2f2f2"]

// 定义副标题颜色
#define color_textOne [UIColor py_colorWithHexString:@"#323232"]

// 定义副标题颜色
#define color_textTwo [UIColor py_colorWithHexString:@"#666666"]

// 定义副标题颜色
#define color_textThree [UIColor py_colorWithHexString:@"#999999"]

// 定义按钮颜色
#define color_coffee  [UIColor py_colorWithHexString:@"#5F3100"]

// 定义线条颜色
#define color_lineColor [UIColor py_colorWithHexString:@"#dddddd"]

// 定义蓝色
#define color_blueColor [UIColor py_colorWithHexString:@"#5cb4ea"]


//定义颜色
#define kColor(color) [UIColor py_colorWithHexString:STR(color)]
//将其他类型转换成字符串
#define STR(string) [NSString stringWithFormat:@"%@", string]

//请求数据成功
#define REQUESTDATASUCCESS [[NSString stringWithFormat:@"%@",[responseObject objectForKey:@"result"]] isEqualToString:@"success"]
//返回数据成功
#define successFlag @"0"


#define kServiceURL @"http://118.190.162.110:9090"


#endif /* HeaderURL_h */
