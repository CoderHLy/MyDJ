//
//  HLPersonageVC.m
//  党建e家
//
//  Created by 何龙 on 2018/11/1.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HLPersonageVC.h"
#import "HLPersonageView.h"
@interface HLPersonageVC ()<HLPersonageViewDelegate>

@end

@implementation HLPersonageVC{
    HLPersonageView *_personageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人总结";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initPersonageView];
    // Do any additional setup after loading the view.
}
#pragma mark - 添加自定义view
-(void)initPersonageView
{
    _personageView = [[HLPersonageView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    _personageView.delegate = self;
    [self.view addSubview:_personageView];
}
-(void)btnSelect
{
    NSLog(@"提交审核");
    [self.navigationController popViewControllerAnimated:YES];
}


@end
