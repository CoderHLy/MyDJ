//
//  LoGinViewController.m
//  党建e家
//
//  Created by 黄钦 on 2018/10/25.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "LoGinViewController.h"
#import "View.h"
#import "Masonry.h"
#import "AFHTTPSessionManager.h"
#import "PerInfoViewController.h"
@interface LoGinViewController ()
@property(nonatomic , strong) View *vc;
//@property(nonatomic , strong) NSDictionary *datadic;
@end

@implementation LoGinViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"登录";
    _vc = [[View alloc]init];
    [self.view addSubview:_vc];
    [_vc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(self.view.frame.size.width, self.view.frame.size.height-60));
        make.top.equalTo(0);
        make.left.equalTo(0);
    }];
    __weak typeof(self) weakself = self;
    _vc.block = ^(View * _Nonnull vc) {
        NSDictionary *dic = @{@"id_card":weakself.vc.nametextfiled.text,@"password":weakself.vc.passtextfiled.text};
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:@"http://211.67.177.56:8080"]];
        [manager POST:@"/hhdj/user/userLogin.do" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
        {
            if ([[responseObject valueForKey:@"msg"] isEqualToString:@"登录成功"])
            {
                NSLog(@"登录成功");
                NSLog(@"%@" , responseObject);
                PerInfoViewController *perinfovc = [[PerInfoViewController alloc]init];
                perinfovc.perInfoDic = [responseObject valueForKey:@"data"];
                NSLog(@"%@" , perinfovc.perInfoDic);
                [weakself.navigationController popViewControllerAnimated:YES];
                [[NSUserDefaults standardUserDefaults] setObject:[responseObject valueForKey:@"token"] forKey:@"token"];
            }
            else
            {
                NSLog(@"登录失败");
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"密码或者账号输入错误" message:@"请重新输入" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                [weakself.view addSubview:alertView];
                [alertView show];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
    };
}

@end
