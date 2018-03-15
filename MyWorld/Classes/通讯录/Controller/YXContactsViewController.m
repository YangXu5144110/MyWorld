//
//  YXContactsViewController.m
//  MyWorld
//
//  Created by 杨旭 on 2017/11/21.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXContactsViewController.h"
#import "BRContactsCell.h"
#import "BRContactsModel.h"
#import "BRGroupModel.h"
#import "BRSearchBarView.h"
#import "YXAddBuddyViewController.h"
@interface YXContactsViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    NSIndexPath *_indexPath; // 保存当前选中的单元格
}
/** 搜索框视图 */
@property (nonatomic,strong) BRSearchBarView *searchBarView;
@property (nonatomic, strong) UITableView *tableView;
/** 保存分组数据模型 */
@property (nonatomic, strong) NSMutableArray *groupModelArr;
/** 保存旋转状态(展开/折叠) */
@property (nonatomic, strong) NSMutableArray *switchArr;
@end

@implementation YXContactsViewController

- (BRSearchBarView *)searchBarView {
    if(_searchBarView == nil) {
        _searchBarView = [[BRSearchBarView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    }
    return _searchBarView;
}


#pragma mark- 懒加载视图
- (UITableView *)tableView {
    if(_tableView == nil) {
        // 原点位置是(0,0)
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64)];
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        // 设置表格头视图
        _tableView.tableHeaderView = self.searchBarView;
        [self.view addSubview:_tableView];
        
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self createNarUI];
    [self loadData];
}

- (void)createNarUI {
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(addItemAction:)];
    addItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = addItem;
    
}
- (void)addItemAction:(UIBarButtonItem *)sender {
    YXAddBuddyViewController *addVC = [[YXAddBuddyViewController alloc] init];
    addVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:addVC animated:YES];
}

- (void)loadData {
    self.groupModelArr = nil;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 加载本地数据（实际开发中这里写网络请求，从服务端请求数据...）
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"contacts" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        NSLog(@"数据内容：%@", jsonObj);
        NSString *retCode = jsonObj[@"ret_code"];
        if ([retCode isEqualToString:successFlag]) {
            // 解析返回的结果：JSON转数据模型
            NSMutableArray *groupModelArr = [BRGroupModel mj_objectArrayWithKeyValuesArray:jsonObj[@"groups"]];
            self.groupModelArr = groupModelArr;
            
            for (NSInteger i = 0; i < self.groupModelArr.count; i++) {
                // 加个判断，防止多次重复调用这个方法时，造成数据累加无限添加
                if (self.switchArr.count < self.groupModelArr.count) {
                    [self.switchArr addObject:@NO];
                }
            }
            // 回到主线程刷新表格
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
    });
}


#pragma mark- UITableViewDataSource, UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groupModelArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    BRGroupModel *model = self.groupModelArr[section];
    if ([self.switchArr[section] boolValue] == YES) {
        return model.contacts.count;
    } else {
        return 0;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BRContactsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[BRContactsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    BRGroupModel *gModel = self.groupModelArr[indexPath.section];
    cell.model = gModel.contacts[indexPath.row];
    // 添加单元格的长按手势
    UILongPressGestureRecognizer *longPressed = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressToDo:)];
    longPressed.minimumPressDuration = 1;
    [cell.contentView addGestureRecognizer:longPressed];
    return cell;
}


// 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60 / 375.0 * kScreenWidth;
}
// 分区头的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50 / 375.0 * kScreenWidth;
}
// 分区尾的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 10.0f;
    } else {
        return 1.0f;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320 / 375.0 * kScreenWidth, 50 / 375.0 * kScreenWidth)];
    view.backgroundColor = [UIColor whiteColor];
    // 边界线
    UIView *borderView = [[UIView alloc]initWithFrame:CGRectMake(0, 50 / 375.0 * kScreenWidth, kScreenWidth, 0.5)];
    borderView.backgroundColor = color_lineColor;
    [view addSubview:borderView];
    // 展开箭头
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(15 / 375.0 * kScreenWidth, 19 / 375.0 * kScreenWidth, 14 / 375.0 * kScreenWidth, 12 / 375.0 * kScreenWidth)];
    imageView.image = [UIImage imageNamed:@"pulldownList.png"];
    [view addSubview:imageView];
    // 分组名Label
    UILabel *groupLable = [[UILabel alloc]initWithFrame:CGRectMake(45 / 375.0 * kScreenWidth, 0, kScreenWidth, 50 / 375.0 * kScreenWidth)];
    BRGroupModel *model = _groupModelArr[section];
    groupLable.text = [NSString stringWithFormat:@"%@ ( %ld )", model.groupName, (long)model.memberNum];
    groupLable.textColor = [UIColor colorWithRed:0.21 green:0.21 blue:0.21 alpha:1.0];
    groupLable.font = [UIFont systemFontOfSize:16];
    [view addSubview:groupLable];
    
    view.userInteractionEnabled = YES;
    // 初始化一个手势
    UITapGestureRecognizer *myTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openClick:)];
    // 给view添加手势
    [view addGestureRecognizer:myTap];
    view.tag = 1000 + section;
    
    CGFloat rota;
    if ([self.switchArr[section] boolValue] == NO) {
        rota = 0;
    } else {
        rota = M_PI_2; //π/2
    }
    imageView.transform = CGAffineTransformMakeRotation(rota);//箭头偏移π/2
    return view;
}

- (void)openClick:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    NSInteger section = sender.view.tag - 1000;
    if ([self.switchArr[section] boolValue] == NO) {
        [self.switchArr replaceObjectAtIndex:section withObject:@YES];
    } else {
        [self.switchArr replaceObjectAtIndex:section withObject:@NO];
    }
    if (section >= 0) {
        // 刷新分区
        [_tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}
- (NSMutableArray *)groupModelArr {
    if (!_groupModelArr) {
        _groupModelArr = [[NSMutableArray alloc] init];
    }
    return _groupModelArr;
}

- (NSMutableArray *)switchArr {
    if (!_switchArr) {
        _switchArr = [[NSMutableArray alloc]init];
    }
    return _switchArr;
}




@end
