//
//  MyDjContentView.m
//  党建e家
//
//  Created by Sunweisheng on 2018/10/25.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import "MyDjContentView.h"

@implementation MyDjContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _imgArr = [NSArray arrayWithObjects:@"myInfo", @"integral", @"update_pwd", @"icon3", nil];
        _labArr = [NSArray arrayWithObjects:@"个人信息", @"个人量化积分", @"修改密码", @"党费缴纳", nil];
        
        for (int i = 0; i < 4; ++i)
        {
            //左边小图标
            _leftImageView = [UIImageView imageWithImage:_imgArr[i] subView:self];
            [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(10 + 50 * i);
                make.left.equalTo(10);
                make.width.height.equalTo(30);
            }];
            
            //label
            _textLab = [UILabel labelWithText:_labArr[i] alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:16 superView:self];
            [_textLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(10 + 50 * i);
                make.left.equalTo(self.leftImageView.right).offset(10);
                make.height.equalTo(30);
                make.width.equalTo(180);
            }];
            
            //右边箭头
            _rightBtn = [UIButton buttonWithTag:i Target:self selector:@selector(jumpVC:) superView:self];
            [_rightBtn setImage:[UIImage imageNamed:@"jiantou"] forState:UIControlStateNormal];
            //设置button上的图片的位置。
            _rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(15 + 50 * i);
                make.right.equalTo(-15);
                make.height.equalTo(20);
                make.width.equalTo(SCREENWIDTH);
            }];
            
            //线
            _lineView = [UIImageView imageWithImage:@"" subView:self];
            _lineView.backgroundColor = [UIColor grayColor];
            [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(50 + 50 * i);
                make.left.equalTo(0);
                make.width.equalTo(SCREENWIDTH);
                make.height.equalTo(0.5);
            }];
        }
        
        //登录按钮
        _loginBtn = [UIButton buttonWithTag:00 Target:self selector:@selector(jumpLoginPage) superView:self];
        _loginBtn.backgroundColor = [UIColor redColor];
        _loginBtn.titleLabel.textColor = [UIColor whiteColor];
        [_loginBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        _loginBtn.layer.cornerRadius = 5;
        _loginBtn.layer.masksToBounds = YES;
        [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(220);
            make.left.equalTo(10);
            make.width.equalTo(SCREENWIDTH - 20);
            make.height.equalTo(45);
        }];
        
    }
    return self;
}

-(void)jumpVC:(UIButton *)btn
{
    [_delegate contentViewJumpVC:btn.tag];
}

-(void)jumpLoginPage
{
    NSLog(@"退出登录");
    if (_exitBlock)
    {
        _exitBlock(self);
    }
}
@end
