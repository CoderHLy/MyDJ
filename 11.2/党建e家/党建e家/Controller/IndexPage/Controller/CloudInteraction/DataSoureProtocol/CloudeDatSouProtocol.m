
//
//  CloudeDatSouProtocol.m
//  党建e家
//
//  Created by Sunweisheng on 2018/11/1.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import "CloudeDatSouProtocol.h"
#import "WSClodeIntTableViewCell.h"
#import "CloudeModel.h"
@implementation CloudeDatSouProtocol

#pragma mark -------------------UITableViewDataSource--------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WSClodeIntTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WSClodeIntTableViewCell"];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    CloudeModel *model = [[CloudeModel alloc] init];
    model = self.cloudeDatSourceArr[indexPath.row];
    [cell setModel:model];
    
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cloudeDatSourceArr.count;
}

@end
