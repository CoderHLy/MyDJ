//
//  HLDemocraticVC.m
//  党建e家
//
//  Created by 何龙 on 2018/11/1.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HLDemocraticVC.h"
#import "HLDemocraticView.h"
#import "HLListTableViewVC.h"
@interface HLDemocraticVC ()<HLDemocraticViewDelegate>

@end

@implementation HLDemocraticVC{
    HLDemocraticView *_bodyView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"民主评议";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initDemocraticView];
    // Do any additional setup after loading the view.
}
#pragma mark - 添加自定义view
-(void)initDemocraticView
{
    _bodyView = [[HLDemocraticView alloc] init];
    _bodyView.delegate = self;
    [self.view addSubview:_bodyView];
    [_bodyView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(0);
        make.top.equalTo(0);
        make.size.equalTo(CGSizeMake(SCREENWIDTH, SCREENHEIGHT - 64));
    }];
}
-(void)nextPageWithBranchId:(NSString *)Id
{
    HLListTableViewVC *ListVC = [[HLListTableViewVC alloc] init];
    ListVC.title = @"参评党员";
    ListVC.selecte_branch = Id;
    [self.navigationController pushViewController:ListVC animated:YES];
}


@end
