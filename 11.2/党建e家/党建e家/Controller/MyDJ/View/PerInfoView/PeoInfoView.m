//
//  PeoInfoView.m
//  党建e家
//
//  Created by Sunweisheng on 2018/10/26.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import "PeoInfoView.h"
#import "Masonry.h"
@implementation PeoInfoView
-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
//        self.backgroundColor = [UIColor whiteColor];
        _label = [[UILabel alloc]init];
//        _label.backgroundColor = [UIColor orangeColor];
        _label.font = [UIFont systemFontOfSize:13];
        _label.textColor = [UIColor orangeColor];
        [self addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.centerY);
            make.left.equalTo(15);
            make.width.equalTo(121);
            make.height.equalTo(30);
        }];
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        _textfiled = [[[HuangQinUITextField alloc]init] dic:attributes superView:self text:@"" color:[UIColor whiteColor]];
        _textfiled.backgroundColor = [UIColor greenColor];
        _textfiled.textAlignment = NSTextAlignmentRight;
        [_textfiled mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.centerY);
            make.right.equalTo(1);
            make.width.equalTo(100);
            make.height.equalTo(30);
        }];
        _line = [[UIView alloc]init];
        _line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_line];
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.bottom).offset(0);
            make.width.equalTo(SCREENWIDTH);
            make.left.equalTo(0);
            make.height.equalTo(1);
        }];
    }
    return self;
}

@end
