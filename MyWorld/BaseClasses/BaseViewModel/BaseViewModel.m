//
//  BaseViewModel.m
//  HMTakeMerchants
//
//  Created by 李小朋 on 2017/10/23.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel
- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
@end
