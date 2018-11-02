//
//  ChangePwdController.m
//  党建e家
//
//  Created by Sunweisheng on 2018/10/26.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import "ChangePwdController.h"
#import "ChangePwdView.h"
@interface ChangePwdController ()

@property (nonatomic,strong) ChangePwdView *changePwdView;

@end

@implementation ChangePwdController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"修改密码";
    [self initChangePwdView];
}

//初始化修改密码页面
-(void)initChangePwdView
{
    _changePwdView = [[ChangePwdView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
//    _changePwdView.userInteractionEnabled = YES;
    __weak typeof(self) weakSelf = self;
    _changePwdView.block = ^(ChangePwdView * _Nonnull myBlock) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    [self.view addSubview:_changePwdView];
}

@end
