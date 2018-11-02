//
//  PerInfoViewController.m
//  党建e家
//
//  Created by Sunweisheng on 2018/10/26.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import "PerInfoViewController.h"
#import "PeoInfoView.h"
#import "AFNetworking.h"
@interface PerInfoViewController ()
@property(nonatomic , strong) UIButton *rightbnt;
@property(nonatomic , strong) UIView *weightview;
@property(nonatomic , strong) PeoInfoView *peoinfoview;
@property(nonatomic , strong) AFHTTPSessionManager *manager;
@end

@implementation PerInfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.title = @"个人信息";
    _rightbnt = [UIButton buttonWithType:UIButtonTypeCustom];
    [_rightbnt setTitle:@"编辑" forState:UIControlStateNormal];
    [_rightbnt setTitle:@"保存" forState:UIControlStateSelected];
//    [_rightbnt addTarget:self action:@selector(pan) forControlEvents:UIControlEventTouchUpInside];
    _rightbnt.titleLabel.font = [UIFont systemFontOfSize:15];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_rightbnt];
    [self pan];
    NSArray *arry = [NSArray arrayWithObjects:@"头像",@"姓名",@"身份证",@"家庭地址",@"工作地址",@"民族",@"微信号",@"qq号",@"性别",@"最高学历",@"职称",@"薪资水平",@"入党时间",@"党费最后缴纳时间",@"当前身份", nil];
    __weak typeof(self) weakself = self;
    _manager = [[AFHTTPSessionManager alloc]init];
    NSString *str = [[NSUserDefaults standardUserDefaults] valueForKey:@"token"];
    NSLog(@"%@" , str);
    NSDictionary *dic = @{@"id":@"28",@"idCard":@"412826198206134955"};
    [_manager.requestSerializer setValue:str forHTTPHeaderField:@"token"];
    [_manager POST:@"http://211.67.177.56:8080/hhdj/user/userInfo.do" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@" , responseObject);
        
        for (int i = 0; i < 15; i ++)
        {
            weakself.peoinfoview = [[PeoInfoView alloc]init];
            weakself.peoinfoview.label.text = arry[i];
            [self.view addSubview:weakself.peoinfoview];
            [weakself.peoinfoview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(0 + 39 * i);
                make.left.equalTo(0);
                make.right.equalTo(0);
                make.height.equalTo(self.view.frame.size.height / 15);
            }];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}
-(void)pan
{
    if (!_rightbnt.selected)
    {
        _rightbnt.selected = YES;
        NSLog(@"++++++++++++");
    }
    else
    {
        _rightbnt.selected = NO;
        NSLog(@"--------------");
    }
}

@end
