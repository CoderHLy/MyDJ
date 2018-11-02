//
//  HLDemocraticIndexVC.m
//  党建e家
//
//  Created by 何龙 on 2018/11/1.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HLDemocraticIndexVC.h"
#import "HLDemocraticVC.h"
#import "HLPersonageVC.h"
@interface HLDemocraticIndexVC ()

@end

@implementation HLDemocraticIndexVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"掌上组织生活";
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *arr = @[@"个人总结",@"民主评议"];
    for (int i = 0; i < 2; i++) {
        UIButton *btn = [UIButton buttonWithTitle:arr[i] Target:self selector:@selector(btn:) superView:self.view];
        btn.tag = i;
        [btn makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view.centerX);
            make.centerY.equalTo(self.view.centerY).offset(70 * (i - 1));
            make.size.equalTo(CGSizeMake(200, 50));
        }];
    }
}
-(void)btn:(UIButton *)btn
{
    if (btn.tag == 0) {
        [self.navigationController pushViewController:[[HLPersonageVC alloc] init] animated:YES];
    } else {
        [self.navigationController pushViewController:[[HLDemocraticVC alloc] init] animated:YES];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
