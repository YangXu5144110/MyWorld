//
//  YXHotContentCell.m
//  MyWorld
//
//  Created by 杨旭 on 2017/12/2.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXHotContentCell.h"

@implementation YXHotContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)praiseBtn:(UIButton *)sender {
    sender.selected = !sender.selected;
}

@end
