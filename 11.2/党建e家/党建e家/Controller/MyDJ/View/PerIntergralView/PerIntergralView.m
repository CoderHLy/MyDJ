//
//  PerIntergralView.m
//  党建e家
//
//  Created by Sunweisheng on 2018/10/26.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import "PerIntergralView.h"

@implementation PerIntergralView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //线
        _lineView = [UIImageView imageWithImage:@"" subView:self];
        _lineView.backgroundColor = [UIColor grayColor];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(8);
            make.left.equalTo(0);
            make.width.equalTo(SCREENWIDTH);
            make.height.equalTo(0.5);
        }];
        
        //左边小图标
        _leftImageView = [UIImageView imageWithImage:@"integral" subView:self];
        [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.lineView.bottom).offset(10);
            make.left.equalTo(10);
            make.width.height.equalTo(30);
        }];
        
        //label
        _textLab = [UILabel labelWithText:@"积分明细" alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:16 superView:self];
        [_textLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.lineView.bottom).offset(10);
            make.left.equalTo(self.leftImageView.right).offset(10);
            make.height.equalTo(30);
            make.width.equalTo(180);
        }];
        
        //右边箭头
        _rightBtn = [UIButton buttonWithTag:00 Target:self selector:@selector(jumpVC:) superView:self];
        [_rightBtn setImage:[UIImage imageNamed:@"jiantou"] forState:UIControlStateNormal];
        //设置button上的图片的位置。
        _rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.lineView.bottom).offset(15);
            make.right.equalTo(-15);
            make.height.equalTo(20);
            make.width.equalTo(SCREENWIDTH);
        }];
        
        UILabel *rule = [UILabel labelWithText:@"   积分规则" alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:14 superView:self];
        rule.backgroundColor = Color(238, 238, 238);
        [rule makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.textLab.bottom).offset(10);
            make.left.equalTo(0);
            make.width.equalTo(SCREENWIDTH);
            make.height.equalTo(40);
        }];
        
        UIImageView *quesImgView = [UIImageView imageWithImage:@"question" subView:self];
        [quesImgView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.textLab.bottom).offset(20);
            make.right.equalTo(-10);
            make.height.width.equalTo(20);
        }];
    }
    return self;
}

-(void)jumpVC:(UIButton *)btn
{
    if (self.delegate)
    {
        [self.delegate jumpRuleVc];
    }
}

@end
