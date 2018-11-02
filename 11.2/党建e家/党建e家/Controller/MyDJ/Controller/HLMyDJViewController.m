//
//  HLMyDJViewController.m
//  党建e家
//
//  Created by 何龙 on 2018/10/25.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HLMyDJViewController.h"
#import "LoGinViewController.h"
#import "PerInfoViewController.h"
#import "MyDjHeadView.h"
#import "MyDjContentView.h"
#import "ChargeViewController.h"
#import "ChangePwdController.h"
#import "PerIntegralViewController.h"
@interface HLMyDJViewController ()<MyDjContentViewDelegate>

@property (nonatomic,strong) MyDjHeadView *djHeadView;

@property (nonatomic,strong) MyDjContentView *myDjContentView;

@end

@implementation HLMyDJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的党建";
    //初始化headView
    [self initHeadView];
    //初始化内容View
    [self initContentView];
}
//初始化headView
-(void)initHeadView
{
    _djHeadView = [[MyDjHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 160)];
    __weak typeof(self) weakSelf = self;
    _djHeadView.djBlock = ^(MyDjHeadView * _Nonnull headView) {
        //跳入登录页面
        [weakSelf.navigationController pushViewController:[[LoGinViewController alloc] init] animated:YES];
    };
    [self.view addSubview:_djHeadView];
}

//初始化内容View
-(void)initContentView
{
    _myDjContentView = [[MyDjContentView alloc] initWithFrame:CGRectMake(0, 160, SCREENWIDTH, 280)];
    _myDjContentView.userInteractionEnabled = YES;
    __weak typeof(self) weakSelf = self;
    _myDjContentView.exitBlock = ^(MyDjContentView * _Nonnull myDjContentView) {
        [weakSelf.navigationController pushViewController:[[LoGinViewController alloc] init] animated:YES];
    };
    _myDjContentView.delegate = self;
    [self.view addSubview:_myDjContentView];
}
//跳转页面
- (void)contentViewJumpVC:(NSInteger)tag
{
    switch (tag) {
        case 0:
        {
            [self.navigationController pushViewController:[[PerInfoViewController alloc] init] animated:YES];
        }
            break;
        case 1:
        {
           [self.navigationController pushViewController:[[PerIntegralViewController alloc] init] animated:YES];
        }
            break;
        case 2:
        {
            [self.navigationController pushViewController:[[ChangePwdController alloc] init] animated:YES];
        }
            break;
        case 3:
        {
            [self.navigationController pushViewController:[[ChargeViewController alloc] init] animated:YES];
        }
            break;
            
        default:
            break;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //去除导航栏下方的横线
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}
@end
