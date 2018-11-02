//
//  View.m
//  党建e家
//
//  Created by 黄钦 on 2018/10/25.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "View.h"
#import "Masonry.h"
@implementation View

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = Color(182, 0, 10);
        _imageview = [UIImageView imageWithImage:@"logo" subView:self];
        [_imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0);
            make.centerX.equalTo(self.centerX);
            make.width.equalTo(180);
            make.height.equalTo(60);
        }];
        _nameimageview = [UIImageView imageWithImage:@"登录框" subView:self];
        [_nameimageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageview.bottom).offset(33);
            make.left.equalTo(30);
            make.right.equalTo(-30);
            make.height.equalTo(39);
        }];
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        _nametextfiled = [[[HuangQinUITextField alloc]init] dic:attributes superView:self text:@"身份证号" color:[UIColor whiteColor]];
        [_nametextfiled mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameimageview.top).offset(3);
            make.left.equalTo(self.nameimageview.left).offset(3);
            make.width.equalTo(200);
            make.height.equalTo(30);
        }];
        _passimageview = [UIImageView imageWithImage:@"登录框" subView:self];
        [_passimageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameimageview.bottom).offset(8);
            make.left.equalTo(30);
            make.right.equalTo(-30);
            make.height.equalTo(39);
        }];
        _passtextfiled = [[[HuangQinUITextField alloc]init] dic:attributes superView:self text:@"密码" color:[UIColor whiteColor]];
        [self addSubview:_passtextfiled];
        [_passtextfiled mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.passimageview.top).offset(3);
            make.left.equalTo(self.passimageview.left).offset(3);
            make.width.equalTo(200);
            make.height.equalTo(30);
        }];
        _loginbnt = [UIButton btnWithBGcolor:Color(225, 88, 83) settitle:@"登录" Font:13.0 cornerRadius:5 masksToBounds:YES superView:self section:@selector(back) Target:self settitlecolor:[UIColor whiteColor]];
        [_loginbnt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.passimageview.bottom).offset(8);
            make.width.equalTo(SCREENWIDTH - 60);
            make.left.equalTo(30);
            make.height.equalTo(39);
        }];
   }
    return self;
}
-(void)back
{
    if (_block)
    {
        _block(self);
    }
}
@end
