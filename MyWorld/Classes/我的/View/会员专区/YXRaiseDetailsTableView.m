//
//  YXRaiseDetailsTableView.m
//  MyWorld
//
//  Created by 杨旭 on 2017/12/8.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXRaiseDetailsTableView.h"
#import "YXServiceCell.h"
@interface YXRaiseDetailsTableView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UIView *headerView;
@property (nonatomic ,strong) UIImageView *picImageView;
@property (nonatomic ,strong) UILabel *titleLab;
@property (nonatomic ,strong) UILabel *fundraisingLab;
@property (nonatomic ,strong) UILabel *peopleLab;
@property (nonatomic ,strong) UILabel *detonationLab;
@property (nonatomic ,strong) UILabel *percentageLab;
@property (nonatomic ,strong) UILabel *priceLab;
@property (nonatomic ,strong) UILabel *timeLab;
@property (nonatomic ,strong) UIView *backline;
@property (nonatomic ,strong) UIView *orangeLine;
@property (nonatomic ,strong) UIView *lineView;

@end

@implementation YXRaiseDetailsTableView

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 380))];
        [_headerView addSubview:self.picImageView];
        [_headerView addSubview:self.titleLab];
        [_headerView addSubview:self.fundraisingLab];
        [_headerView addSubview:self.peopleLab];
        [_headerView addSubview:self.detonationLab];
        [_headerView addSubview:self.percentageLab];
        [_headerView addSubview:self.priceLab];
        [_headerView addSubview:self.timeLab];
        [_headerView addSubview:self.backline];
        [_headerView addSubview:self.orangeLine];
        [_headerView addSubview:self.lineView];
        
    }
    return _headerView;
}
- (UIImageView *)picImageView {
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhong-backbg"]];
        _picImageView.frame = CGRectMake(0, 0, kScreenWidth, 250);
    }
    return _picImageView;
}
- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel setLabelWithText:@"等离子除菌收纳箱" fontSize:18 color:color_textOne];
    }
    return _titleLab;
}
- (UILabel *)fundraisingLab {
    if (!_fundraisingLab) {
        _fundraisingLab = [UILabel setLabelWithText:@"筹款中" fontSize:14 color:[UIColor whiteColor]];
        _fundraisingLab.backgroundColor = [UIColor redColor];
        _fundraisingLab.textAlignment = NSTextAlignmentCenter;
        
    }
    return _fundraisingLab;
}
- (UILabel *)peopleLab {
    if (!_peopleLab) {
        _peopleLab = [UILabel setLabelWithText:@"160/200人参与" fontSize:16 color:color_textOne];
    }
    return _peopleLab;
}
- (UILabel *)detonationLab {
    if (!_detonationLab) {
        _detonationLab = [UILabel setLabelWithText:@"爆" fontSize:14 color:[UIColor whiteColor]];
        _detonationLab.backgroundColor = [UIColor redColor];
    }
    return _detonationLab;
}
- (UILabel *)percentageLab {
    if (!_percentageLab) {
        _percentageLab = [UILabel setLabelWithText:@"达成%60" fontSize:16 color:color_textOne];
    }
    return _percentageLab;
}

- (UIView *)backline {
    if (!_backline) {
        _backline = [[UIView alloc] init];
        _backline.backgroundColor = [UIColor darkGrayColor];
    }
    return _backline;
}
- (UIView *)orangeLine {
    if (!_orangeLine) {
        _orangeLine = [[UIView alloc] init];
        _orangeLine.backgroundColor = [UIColor orangeColor];
    }
    return _orangeLine;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel setLabelWithText:@"2000000元 已筹" fontSize:14 color:[UIColor redColor]];
    }
    return _priceLab;
}
- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel setLabelWithText:@"进展剩余12天" fontSize:16 color:[UIColor redColor]];
    }
    return _timeLab;
}
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = color_lineColor;
    }
    return _lineView;
}

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.separatorStyle = UITableViewCellSelectionStyleNone;
        self.dataSource = self;
        self.delegate = self;
        self.estimatedRowHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
        self.tableHeaderView = self.headerView;
        [self registerClass:[YXServiceCell class] forCellReuseIdentifier:@"YXServiceCell"];
    }
    return self;
}

#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        NSString *cellID = @"cellID";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
        }
        cell.textLabel.text = @"已选： 支持500元";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 1) {
        YXServiceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YXServiceCell" forIndexPath:indexPath];
        return cell;
    }else {
        NSString *cellID = @"allerCellID";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:cellID];
        }
        cell.imageView.image = [UIImage imageNamed:@"page-1"];
        cell.textLabel.text = @"Aller";
        cell.detailTextLabel.text = @"等离子生物防治专家";
        return cell;
    }
    
    return [[UITableViewCell alloc] init];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 44;
    }else if (indexPath.section == 1) {
        return 130;
    }else {
        return 60;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 8))];
    backView.backgroundColor = color_backColor;
    return backView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return section == 2 ? 0 : 8;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    YXWeakSelf
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_picImageView.mas_bottom).offset(20);
        make.centerX.equalTo(weakSelf.mas_centerX);
        [_titleLab sizeToFit];
    }];
    
    [_fundraisingLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_titleLab.mas_centerY);
        make.left.equalTo(_titleLab.mas_right).offset(15);
        make.size.mas_equalTo(CGSizeMake(46, 20));
    }];
    
    [_peopleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.headerView.mas_left).offset(20);
        make.top.equalTo(_titleLab.mas_bottom).offset(20);
        [_peopleLab sizeToFit];
    }];
    
    [_detonationLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_peopleLab.mas_right).offset(0);
        make.centerY.equalTo(_peopleLab.mas_centerY);
    }];
    
    [_percentageLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLab.mas_bottom).offset(20);
        make.right.equalTo(weakSelf.headerView.mas_right).offset(-20);
        [_peopleLab sizeToFit];
    }];;
    
    [_backline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_peopleLab.mas_bottom).offset(5);
        make.left.equalTo(weakSelf.headerView.mas_left).offset(20);
        make.right.equalTo(weakSelf.headerView.mas_right).offset(-20);
        make.height.offset(5);
    }];
    
    [_orangeLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_peopleLab.mas_bottom).offset(5);
        make.left.equalTo(weakSelf.headerView.mas_left).offset(20);
        make.width.offset(200);
        make.height.offset(5);
    }];
    
    [_priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_backline.mas_bottom).offset(10);
        make.left.equalTo(weakSelf.headerView.mas_left).offset(20);
        [_priceLab sizeToFit];
    }];
    
    [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.headerView.mas_right).offset(-20);
        make.top.equalTo(_backline.mas_bottom).offset(10);
        [_timeLab sizeToFit];
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.headerView.mas_left).offset(0);
        make.bottom.equalTo(weakSelf.headerView.mas_bottom).offset(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1));
    }];
}



@end
