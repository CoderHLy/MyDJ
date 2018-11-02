//
//  HLListTableViewVC.m
//  党建e家
//
//  Created by 何龙 on 2018/11/1.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HLListTableViewVC.h"
#import "HLListTableViewCell.h"
#import "HLListTableViewModel.h"
#import "HLListModel.h"
@interface HLListTableViewVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *aTableView;
@end
#define CellId @"cell"
@implementation HLListTableViewVC{
    NSMutableArray *_objArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.aTableView.backgroundColor = [UIColor orangeColor];
}
-(UITableView *)aTableView{
    if (!_aTableView) {
        _aTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT - 64) style:UITableViewStylePlain];
        _aTableView.delegate = self;
        _aTableView.dataSource = self;
        _aTableView.showsVerticalScrollIndicator = NO;
        [_aTableView registerClass:[HLListTableViewCell class] forCellReuseIdentifier:CellId];
        [self.view addSubview:_aTableView];
        __weak typeof (self)weakSelf = self;
        HLLIstTableViewModel *viewModel = [[HLLIstTableViewModel alloc] init];
        [viewModel getListWithBranch_id:_selecte_branch callBack:^(NSMutableArray * _Nonnull arr) {
            self->_objArr = arr;
            [weakSelf.aTableView reloadData];
        }];
    }
    return _aTableView;
}
#pragma mark - delegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_objArr) {
        HLListModel *obj = [_objArr objectAtIndex:indexPath.row];
        HLListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
        [cell setModel:obj];
        return cell;
    }
    else
    {
        return nil;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_objArr count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HLListTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
    
    [UILabel labelWithText:@"操作失败！" superView:self.view];
    
    
}
@end
