//
//  GradeDetailViewController.m
//  党建e家
//
//  Created by Sunweisheng on 2018/10/27.
//  Copyright © 2018年 何龙. All rights reserved.
//
#define RuleDetailURL @"http://211.67.177.56:8080/hhdj/integral/integralList.do"

#import "GradeDetailViewController.h"
#import "tableViewDataSource.h"
#import "GradeDetailTableViewCell.h"
#import "WSRuleViewModel.h"
#import "GradeDetailModel.h"
#import "AssignToObject.h"
@interface GradeDetailViewController ()<UITableViewDelegate>

@property (nonatomic,strong) UITableView *aTableView;

@property (nonatomic,strong) TableViewDataSource *tableDataSource;

@property (nonatomic,strong) WSRuleViewModel *ruleViewModel;

@end

@implementation GradeDetailViewController

//懒加载tableView
-(UITableView *)aTableView
{
    if (!_aTableView)
    {
        _aTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT - 70) style:UITableViewStylePlain];
        
        _tableDataSource = [[TableViewDataSource alloc] init];
        
        [_aTableView registerClass:[GradeDetailTableViewCell class] forCellReuseIdentifier:@"GradeDetailTableViewCell"];
        
        _aTableView.delegate = self;
        _aTableView.dataSource = _tableDataSource;
    }
    return _aTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"积分明细";
    
    //获取网络接口数据
    [self gainWebData];
    
    //加载tableView
    [self.view addSubview:self.aTableView];
}
//获取网络接口数据
-(void)gainWebData
{
    NSDictionary *dataDic = @{
                              @"user_id":@"6",
                              @"page":@"1",
                              @"rows":@"20"
                              };
    
    _ruleViewModel = [[WSRuleViewModel alloc] init];
    __weak typeof(self) weakSelf = self;
    [_ruleViewModel postWebData:^(NSMutableArray * _Nonnull arr) {
        //适当的时机为tableViewDataSourceArr赋值
        self.tableDataSource.tableViewDataSourceArr = [AssignToObject customModel:@"GradeDetailModel" ToArray:arr];
    [weakSelf.aTableView reloadData];
    } andUrlStr:RuleDetailURL andDic:dataDic];
}

#pragma mark-----------UITableViewDelegate------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
@end
