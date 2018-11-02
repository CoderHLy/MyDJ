//
//  ruleView.m
//  党建e家
//
//  Created by Sunweisheng on 2018/10/26.
//  Copyright © 2018年 何龙. All rights reserved.
//
#define RuleURL @"http://211.67.177.56:8080/hhdj/integral/integralRule.do"

#import "RuleView.h"
#import "WSRuleViewModel.h"
@implementation RuleView{
    UILabel *titleLab;
    UILabel *gradeLab;
    UIImageView *lineView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _titleArr = [NSMutableArray array];
        _gradeArr = [NSMutableArray array];
        WSRuleViewModel *model = [[WSRuleViewModel alloc] init];
        __weak typeof (self)weakSelf = self;
        [model setRuleObj:^(NSMutableArray * _Nonnull arr) {
            for (int i = 0; i < arr.count; ++i)
            {
                [weakSelf.titleArr addObject:[arr[i] valueForKey:@"typeName"]];
                [weakSelf.gradeArr addObject:[arr[i] valueForKey:@"maxNum"]];
            }
            [weakSelf initViews];
        } andStr:RuleURL];
    }
    return self;
}
#pragma mark - 加载积分规则视图
-(void)initViews
{
    for (int i = 0; i < 18; ++i)
    {
        titleLab = [UILabel labelWithText:self.titleArr[i] alignment:NSTextAlignmentLeft textColor:[UIColor grayColor] font:14 superView:self];
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0 + 30 * i);
            make.left.equalTo(15);
            make.width.equalTo(150);
            make.height.equalTo(30);
        }];
        
        gradeLab = [UILabel labelWithText:[NSString stringWithFormat:@"%@", self.gradeArr[i]] alignment:NSTextAlignmentCenter textColor:[UIColor redColor] font:14 superView:self];
        [gradeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0 + 30 * i);
            make.right.equalTo(-10);
            make.width.equalTo(30);
            make.height.equalTo(30);
        }];
        
        lineView = [[UIImageView alloc] init];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(30 + 30 * i);
            make.width.equalTo(SCREENWIDTH);
            make.left.equalTo(0);
            make.height.equalTo(1);
        }];
    }
}
@end
