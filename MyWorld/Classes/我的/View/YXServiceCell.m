//
//  YXServiceCell.m
//  MyWorld
//
//  Created by 杨旭 on 2017/12/8.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXServiceCell.h"

@interface YXServiceCell ()
@property (nonatomic ,strong) UILabel *serviceLab;
@end

@implementation YXServiceCell

- (UILabel *)serviceLab {
    if (!_serviceLab) {
        _serviceLab = [UILabel setLabelWithText:@"服务：" fontSize:16 color:color_textOne];
        _serviceLab.frame = CGRectMake(15, 10, 50, 20);
    }
    return _serviceLab;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.serviceLab];
        [self setup];
    }
    return self;
}

- (void)setup {
    
    
    NSArray *arr = @[@"有品甄选精品",@"显示免邮 (活动期间)",@"由北京好勒科技有限公司",@"预计12月1日起开始发货"];
    for (int i = 0; i < 4; i++) {
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhongchoudui"]];
        image.frame = CGRectMake(_serviceLab.W + _serviceLab.X, 10 + 30 * i, 20, 20);
        [self.contentView addSubview:image];
        
        UILabel *contentLab = [UILabel setLabelWithText:arr[i] fontSize:16 color:color_textOne];
        contentLab.frame = CGRectMake(image.W + image.X + 5, 10 + 30 * i, 200, 20);
        if (i == 4) {
            contentLab.textColor = [UIColor redColor];
        }
        [self.contentView addSubview:contentLab];
    }
}


@end
