//
//  TableViewDataSource.m
//  党建e家
//
//  Created by Sunweisheng on 2018/10/27.
//  Copyright © 2018年 何龙. All rights reserved.
//
#define RuleDetailURL @"http://211.67.177.56:8080/hhdj/integral/integralList.do"

#import "TableViewDataSource.h"
#import "GradeDetailTableViewCell.h"
#import "GradeDetailModel.h"
#import "WSRuleViewModel.h"
@implementation TableViewDataSource

#pragma mark-----------UITableViewDatasource------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GradeDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GradeDetailTableViewCell"];
    GradeDetailModel *model = self.tableViewDataSourceArr[indexPath.row];

    [cell setModel:model];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableViewDataSourceArr.count;
}

@end
