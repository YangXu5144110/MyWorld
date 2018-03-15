//
//  YXHomeReleaseView.m
//  MyWorld
//
//  Created by 杨旭 on 2017/12/7.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXHomeReleaseView.h"

@interface YXHomeReleaseView ()<UITextViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UIView *backView;
@property (nonatomic ,strong) UITextView *textView;
@property (nonatomic ,strong) UILabel *textLab;
@property (nonatomic ,strong) UILabel *textLengthLab;
@property (nonatomic ,strong) UIButton *redBtn;
@property (nonatomic ,strong) UIButton *addImageBtn;
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSArray *titleArr;
@property (nonatomic ,strong) NSArray *imageArr;
@end

@implementation YXHomeReleaseView

- (NSArray *)titleArr {
    if (!_titleArr) {
        _titleArr = @[@"谁可以看",@"提醒谁看"];
    }
    return _titleArr;
}
- (NSArray *)imageArr {
    if (!_imageArr) {
        _imageArr = @[@"fabu-sheikeyikan",@"fabu-tixingkan"];
    }
    return _imageArr;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, _backView.H+_backView.Y + 34, kScreenWidth, 88)) style:(UITableViewStylePlain)];
        _tableView.scrollEnabled = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 220))];
        _backView.backgroundColor = [UIColor whiteColor];

    }
    return _backView;
}
- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:(CGRectMake(15, 13, kScreenWidth-30, 100))];
//        _textView.backgroundColor = [UIColor redColor];
        _textView.font = [UIFont systemFontOfSize:16];
        _textView.delegate = self;
    }
    return _textView;
}
- (UILabel *)textLab {
    if (!_textLab) {
        _textLab = [UILabel setLabelWithText:@"这一刻的想法..." fontSize:16 color:color_textThree];
        _textLab.frame = CGRectMake(5, 10, 120, 20);
        
    }
    return _textLab;
}
- (UILabel *)textLengthLab {
    if (!_textLengthLab) {
        _textLengthLab = [UILabel setLabelWithText:@"" fontSize:14 color:color_textThree];
        _textLengthLab.frame = CGRectMake(_textView.W - 60,_textView.H - 30, 60, 20);
        _textLengthLab.textAlignment = NSTextAlignmentRight;
    }
    return _textLengthLab;
}
- (UIButton *)redBtn {
    if (!_redBtn) {
        _redBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _redBtn.frame = CGRectMake(20, _textView.H+_textView.Y + 20, 80, 80);
        [_redBtn setImage:[UIImage imageNamed:@"fabu-tu"] forState:(UIControlStateNormal)];
    }
    return _redBtn;
}
- (UIButton *)addImageBtn {
    if (!_addImageBtn) {
        _addImageBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _addImageBtn.frame = CGRectMake(_redBtn.W+_redBtn.X + 5, _textView.H+_textView.Y + 20, 80, 80);
        [_addImageBtn setImage:[UIImage imageNamed:@"fabu-tianjia"] forState:(UIControlStateNormal)];
    }
    return _addImageBtn;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = color_backColor;
        [self setup];
    }
    return self;
}

- (void)setup {

    [self addSubview:self.backView];
    [self.backView addSubview:self.textView];
    [self.textView addSubview:self.textLab];
    [self.textView addSubview:self.textLengthLab];
    [self addSubview:self.redBtn];
    [self addSubview:self.addImageBtn];
    [self addSubview:self.tableView];
    
}

#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"releaseCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.titleArr[indexPath.row];
    cell.imageView.image =  [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.imageArr[indexPath.row]]];
    return cell;
}

#pragma mark - textView Delegate
-(BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    
    self.textLab.text = nil;
    NSInteger number = textView.text.length;
    self.textLengthLab.text = [NSString stringWithFormat:@"%ld/120",number];
    return YES;
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    
    if (textView.text.length == 0) {
        self.textLab.text = @"这一刻的想法...";
    }
    
    [textView resignFirstResponder];
    [textView endEditing:YES];
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView {
    
    NSInteger number = textView.text.length;
    self.textLengthLab.text = [NSString stringWithFormat:@"%ld/120",number];
    
}



- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if (range.location>=120)
        
    {
        
        //控制输入文本的长度
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"最大文字超限" message:@"" preferredStyle:(UIAlertControllerStyleAlert)];
        
        UIAlertAction *alert = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        }];
        
        [alertController addAction:alert];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
        return  NO;
        
    }
    if ([text isEqualToString:@"\n"]) {
        
        //禁止输入换行
        
        return NO;
        
    }
    
    else{
        return YES;
        
    }
}

@end
