//
//  HLIndexBodyView.m
//  党建e家
//
//  Created by 何龙 on 2018/10/25.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HLIndexBodyView.h"

@implementation HLIndexBodyView{
    UIImageView *_headImageView;
    UIImageView *_bodyImageView;
    UIImageView *_footerImageView;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initBackImageView];
        [self initBtnsForHeadImageView];
        [self initBtnsForFooterImageView];
    }
    return self;
}
-(void)initBackImageView{
    //初始化第一部分背景图
    _headImageView = [UIImageView imageName:@"bt_bg" superView:self touch:YES];
    [_headImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(0);
        make.top.equalTo(0);
        make.size.equalTo(CGSizeMake(SCREENWIDTH, SCREENHEIGHT / 4));
    }];
    
    //初始化第二部分背景图
    _bodyImageView = [UIImageView imageName:@"banner01" superView:self touch:NO];
    [_bodyImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(0);
        make.top.equalTo(self->_headImageView.bottom);
        make.size.equalTo(CGSizeMake(SCREENWIDTH, SCREENHEIGHT / 8));
    }];
    
    //初始化第三部分背景图
    _footerImageView = [UIImageView imageName:@"special_column" superView:self touch:YES];
    [_footerImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(0);
        make.top.equalTo(self->_bodyImageView.bottom);
        make.size.equalTo(CGSizeMake(SCREENWIDTH, SCREENHEIGHT / 4));
    }];
}

#pragma mark - 为第一个背景图添加点击事件
-(void)initBtnsForHeadImageView{
    NSArray *textArr = @[@"信工新闻眼",
                         @"掌上组织生活",
                         @"党员云互动",
                         @"党建一点通",
                         @"党员亮身份",
                         @"党史上的今天"];
    for(int i = 0; i < 6; i++)
    {
        //添加btn
        UIButton *btn = [UIButton buttonWithTag:i Target:self selector:@selector(btnSelected:) superView:_headImageView];
        [btn makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo((SCREENWIDTH / 3) * (i % 3));
            make.top.equalTo((SCREENHEIGHT / 8) * (i / 3));
            make.size.equalTo(CGSizeMake(SCREENWIDTH / 3, SCREENHEIGHT / 8));
        }];
        
        //为btn添加图片
        UIImageView *imgView = [UIImageView imageName:[NSString stringWithFormat:@"icon_0%d", i + 1] superView:btn touch:NO];
        [imgView makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(btn.centerX);
            make.centerY.equalTo(btn.centerY).offset(-10);
            make.size.equalTo(CGSizeMake(SCREENWIDTH / 8, SCREENWIDTH / 8));
        }];
        //为btn添加文字
        UILabel *label = [UILabel labelWithText:textArr[i] alignment:NSTextAlignmentCenter textColor:[UIColor grayColor] font:12 superView:btn];
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(btn.centerX);
            make.top.equalTo(imgView.bottom).offset(10);
            make.size.equalTo(CGSizeMake(SCREENWIDTH / 3, 12));
        }];
    }
}
-(void)btnSelected:(UIButton *)btn
{
    if (self.delegate) {
        [self.delegate headerItemDidClicked:btn.tag];
    }
}


#pragma mark - 为第三个背景图添加点击事件
-(void)initBtnsForFooterImageView{
    for (int i = 0; i < 4; i++) {
        UIButton *btn = [UIButton buttonWithTag:i Target:self selector:@selector(footerBtnSelected:) superView:_footerImageView];
        [btn makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(SCREENWIDTH / 3 + (SCREENWIDTH / 3) * (i % 2));
            make.top.equalTo(SCREENHEIGHT / 8 * (i / 2));
            make.size.equalTo(CGSizeMake(SCREENWIDTH / 3, SCREENHEIGHT / 8));
        }];
    }
}

-(void)footerBtnSelected:(UIButton *)btn
{
    if (self.delegate) {
        [self.delegate footerItemDidClicked:btn.tag];
    }
}
@end
