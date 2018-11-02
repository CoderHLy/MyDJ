//
//  MyDjHeadView.m
//  党建e家
//
//  Created by Sunweisheng on 2018/10/25.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import "MyDjHeadView.h"
@implementation MyDjHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //红色背景
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.backgroundColor = Color(182, 0, 10);
        imgView.contentMode = UIViewContentModeScaleAspectFit;
//        imgView.image = [UIImage imageNamed:@"integral_bg"];
        [self addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(0);
            make.width.equalTo(SCREENWIDTH);
            make.height.equalTo(160);
        }];
        _backImgView = imgView;
        _backImgView.userInteractionEnabled = YES;
        
        //头像
        _headImgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_headImgBtn setImage:[UIImage imageNamed:@"my_head"] forState:UIControlStateNormal];
        [_headImgBtn addTarget:self action:@selector(jumpLogin) forControlEvents:UIControlEventTouchUpInside];
        [self.backImgView addSubview:_headImgBtn];
        [_headImgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.centerY);
            make.centerX.equalTo(self.centerX);
            make.height.width.equalTo(60);
        }];
        
        //用户名label
        _userNameLab = [UILabel labelWithText:@"你还没登录" alignment:NSTextAlignmentCenter textColor:[UIColor clearColor] font:14 superView:self.backImgView];
        [_userNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.headImgBtn.bottom).offset(10);
            make.centerX.equalTo(self.centerX);
            make.width.equalTo(150);
            make.height.equalTo(20);
        }];
    }
    return self;
}
//跳入登录页面
-(void)jumpLogin
{
    if (_djBlock)
    {
        _djBlock(self);
    }
}

@end
