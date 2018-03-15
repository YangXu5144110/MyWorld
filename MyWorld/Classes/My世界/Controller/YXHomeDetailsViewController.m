//
//  YXHomeDetailsViewController.m
//  MyWorld
//
//  Created by 杨旭 on 2017/12/1.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXHomeDetailsViewController.h"
#import "YXHotContentCell.h"
@interface YXHomeDetailsViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

/******
 顶部headerView
 ******/
@property (nonatomic ,strong) UIView *headerView;


/******
 承载tableview的背景Scrollview
 ******/
@property(nonatomic,strong)UIScrollView* backGroundScr;
/******
 scr中的三个tableView
 ******/
@property(nonatomic,strong)UITableView* firstTableView;
@property(nonatomic,strong)UITableView* secondTableView;
@property(nonatomic,strong)UITableView* thirdTableView;

/******
 btn名称数组
 ******/
@property(nonatomic,strong)NSArray* titleArray;
/******
 承载btn的view
 ******/
@property(nonatomic,strong)UIView* backGroundView;

/******
 将button全局化
 ******/
@property(nonatomic,strong)UIButton* btn1;
@property(nonatomic,strong)UIButton* btn2;
@property(nonatomic,strong)UIButton* btn3;
/******
 btn底部的红线
 ******/
@property(nonatomic,strong)UIView* redBottomView;
@end

@implementation YXHomeDetailsViewController

-(NSArray* )titleArray{
    if (!_titleArray) {
        _titleArray = @[@"主页",@"圈圈",@"相册"];
    }
    return _titleArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    //进入当前页面使导航变透明
    self.navigationController.navigationBar.translucent=YES;
    //1.1.1 在具有导航栏的viewController中设置导航栏透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:0];
    //这一个方法是将导航栏与主view之间的那个阴影线消除，将导航栏和view无缝连接
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewDidAppear:animated];
    //进入当前页面使导航变透明
    self.navigationController.navigationBar.translucent=NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"tongxun-bg"] forBarMetrics:0];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNarBarUI];
    [self createHeaderViewUI];
    [self configurationUIs];
    [self initTableView:self.firstTableView withX:0];
    [self initTableView:self.secondTableView withX:1];
    [self initTableView:self.thirdTableView withX:2];
}

#pragma mark ------- 初始化导航栏
- (void)createNarBarUI {
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"quanquan-return"] style:(UIBarButtonItemStylePlain) target:self action:@selector(leftAction:)];
    leftItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"quanquan-search"] style:(UIBarButtonItemStylePlain) target:self action:@selector(searchAction:)];
    searchItem.tintColor = [UIColor whiteColor];

    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"quanquan-gengduo"] style:(UIBarButtonItemStylePlain) target:self action:@selector(rightAction:)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItems = @[rightItem,searchItem];
    
}
- (void)leftAction:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)searchAction:(UIBarButtonItem *)sender {
    
}
- (void)rightAction:(UIBarButtonItem *)sender {
    
}
#pragma mark ------- 初始化HeaderView
- (void)createHeaderViewUI {
    
    self.headerView = [[UIView alloc] initWithFrame:(CGRectMake(0, -64, kScreenWidth, 160))];
    [self.view addSubview:self.headerView];
    
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"quanquan-bg"]];
    backImageView.frame = self.headerView.bounds;
    [self.headerView addSubview:backImageView];
    
    UIImageView *userImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"quanquan-rentou"]];
    userImageView.frame = CGRectMake((kScreenWidth - 64)/2, 40, 64, 64);
    [backImageView addSubview:userImageView];
    
    UILabel *userLab = [UILabel setLabelWithText:@"月牙儿" fontSize:18 color:[UIColor whiteColor]];
    userLab.frame = CGRectMake(0, CGRectGetMaxY(userImageView.frame) + 10, kScreenWidth, 20);
    userLab.textAlignment = NSTextAlignmentCenter;
    [backImageView addSubview:userLab];
}

#pragma mark ------ 配置UI
-(void)configurationUIs{
    
    self.backGroundView = [[UIView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(self.headerView.frame) , kScreenWidth, 50)];
    self.backGroundView.backgroundColor = color_backColor;
    [self.view addSubview:self.backGroundView];
    
    CGFloat btnWidth = (kScreenWidth - 12*4)/3;
    CGFloat btnHeight = 30;
    for (int i = 0; i<3; i++) {
        UIButton* clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        clickBtn.tag = i+1;
        int x = i%3;
        clickBtn.frame = CGRectMake(12+(btnWidth+12)*x, 10, btnWidth, btnHeight);
        [clickBtn setTitle:self.titleArray[i] forState:UIControlStateNormal];
        [clickBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //        [clickBtn setBackgroundColor:[UIColor whiteColor]];
        [self.backGroundView addSubview:clickBtn];
        [clickBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        switch (clickBtn.tag) {
            case 1:
                self.btn1 = clickBtn;
                break;
            case 2:
                self.btn2 = clickBtn;
                break;
            case 3:
                self.btn3 = clickBtn;
                break;
        
            default:
                break;
        }
    }
    
    
    self.redBottomView = [[UIView alloc]initWithFrame:CGRectMake(12, 44, (kScreenWidth - 12*4)/3, 2)];
    self.redBottomView.backgroundColor = [UIColor redColor];
    [self.backGroundView addSubview:self.redBottomView];
    self.backGroundScr = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.backGroundView.frame), kScreenWidth, kScreenHeight - 114)];
    self.backGroundScr.contentSize = CGSizeMake(kScreenWidth*3, 0);
    self.backGroundScr.delegate = self;
    self.backGroundScr.pagingEnabled = YES;
    [self.view addSubview:self.backGroundScr];
}

#pragma mark ------- 自定义初始化tableView
- (void) initTableView:(UITableView *)tableView withX:(NSInteger)index{
    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(kScreenWidth*index, 0, kScreenWidth, kScreenHeight-50-64)];
    tableView.tag = index;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = color_backColor;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [tableView registerNib:[UINib nibWithNibName:@"YXHotContentCell" bundle:nil] forCellReuseIdentifier:@"YXHotContentCell"];
    
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 9)];
    [self.backGroundScr addSubview:tableView];
    
}

#pragma mark ------- scrollowView滑动结束后调用的方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (self.backGroundScr == scrollView)
    {
        
        float scrollViewX = scrollView.contentOffset.x;
        
        if (scrollViewX == 0) {
            
            [self btnClick:self.btn1];
            NSLog(@"1--------%ld",self.btn1.tag);
        }
        else if (scrollViewX == kScreenWidth)
        {
            
            [self btnClick:self.btn2];
            NSLog(@"2--------%ld",self.btn1.tag);
            
            
        }
        
        else if (scrollViewX == kScreenWidth*2)
        {
            
            [self btnClick:self.btn3];
            NSLog(@"3--------%ld",self.btn1.tag);
            
        }
    
    }
}
#pragma mark ------ tableView的delegate和datasouce
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 250;
}
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YXHotContentCell* cell = [tableView dequeueReusableCellWithIdentifier:@"YXHotContentCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
 
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
#pragma mark ------ btn的绑定方法
-(void)btnClick:(UIButton* )sender{
    
    //点击btn的时候scrollowView的contentSize发生变化
    [self.backGroundScr setContentOffset:CGPointMake((sender.tag-1) *kScreenWidth, 0) animated:YES];
    
    //btn下方的下划线随动
    [UIView animateWithDuration:0.2 animations:^{
        self.redBottomView.frame = CGRectMake(12+ (sender.tag-1) *((kScreenWidth - 12*4)/3 + 12), 44, (kScreenWidth - 12*4)/3, 2);
    }];
}
@end
