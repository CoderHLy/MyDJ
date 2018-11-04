//
//  ChargeView.m
//  党建e家
//
//  Created by Sunweisheng on 2018/11/4.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import "ChargeView.h"

@implementation ChargeView{
    UIImageView *_lineView;
    UILabel *_titleLab;
    UIImageView *_imageView;
    UILabel *_typeLab;
    UIButton *_btn;
    NSArray *_imgArr;
    NSArray *_labArr;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _imgArr = [NSArray arrayWithObjects:@"WeChat_icon", @"Alipay_icon", nil];
        _labArr = [NSArray arrayWithObjects:@"微信", @"支付宝", nil];
        
        _titleLab = [UILabel labelWithText:@"请选择支付方式" alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:16 superView:self];
        _titleLab.backgroundColor = [UIColor blueColor];
        [_titleLab makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(15);
            make.left.equalTo(10);
            make.height.equalTo(20);
            make.width.equalTo(150);
        }];
        
        //线
        _lineView = [UIImageView imageWithImage:@"" subView:self];
        _lineView.backgroundColor = [UIColor grayColor];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->_titleLab.bottom).offset(15);
            make.left.equalTo(0);
            make.width.equalTo(SCREENWIDTH);
            make.height.equalTo(0.5);
        }];
        //height 50
        for (int i = 0; i < 2; ++i)
        {
            //左边小图标
            _imageView = [[UIImageView alloc] init];
            _imageView.image = [UIImage imageNamed:_imgArr[i]];
            [self addSubview:_imageView];
            [_imageView makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self->_lineView.bottom).offset(10 + 80 * i);
                make.left.equalTo(10);
                make.width.height.equalTo(60);
            }];

            //label
            _typeLab = [UILabel labelWithText:_labArr[i] alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:16 superView:self];
            _typeLab.backgroundColor = [UIColor greenColor];
            [_typeLab makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self->_lineView.bottom).offset(25 + 80 * i);
                make.left.equalTo(self->_imageView.right).offset(10);
                make.height.equalTo(30);
                make.width.equalTo(80);
            }];

            //右边箭头
            _btn = [UIButton buttonWithTag:i Target:self selector:@selector(chargeMethod:) superView:self];
            [_btn setImage:[UIImage imageNamed:@"jiantou"] forState:UIControlStateNormal];
            //设置button上的图片的位置。
            _btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self->_lineView.bottom).offset(25 + 80 * i);
                make.right.equalTo(-15);
                make.height.equalTo(30);
                make.width.equalTo(SCREENWIDTH);
            }];

            //线
            UIImageView *lineView = [UIImageView imageWithImage:@"" subView:self];
            lineView.backgroundColor = [UIColor grayColor];
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(130 + 80 * i);
                make.left.equalTo(0);
                make.width.equalTo(SCREENWIDTH);
                make.height.equalTo(0.5);
            }];
        }
    }
    return self;
}

-(void)chargeMethod:(UIButton *)sender
{
    [_delegate chargeMoney:sender.tag];
}

@end
