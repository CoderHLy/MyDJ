//
//  HLBtnView.m
//  党建e家
//
//  Created by 何龙 on 2018/11/1.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HLBtnView.h"

@implementation HLBtnView{
    NSMutableArray *_titleArr;
}


-(id)initWithFrame:(CGRect)frame
       andTitleArr:(NSMutableArray *)titleArr
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [Color(225, 229, 233) colorWithAlphaComponent:0.93];
        _titleArr = [NSMutableArray array];
        _titleArr = titleArr;
        [self initBtn];
    }
    return  self;
}
#pragma mark -
-(void)initBtn
{
    for (int i = 0; i < [_titleArr count]; i++) {
        UIButton *btn = [UIButton buttonWithTag:i Target:self selector:@selector(btn:) superView:self];
        [btn makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.centerX);
            make.centerY.equalTo(self.centerY).offset(- 60 + 40 * i);
            make.size.equalTo(CGSizeMake(300, 40));
        }];
        UILabel *label = [UILabel labelWithText:[_titleArr[i] valueForKey:@"branch"]  alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:14 superView:btn];
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btn.left).offset(10);
            make.centerY.equalTo(self.centerY).offset(-60 + 40 * i);
            make.size.equalTo(CGSizeMake(280, 40));
        }];
    }
}
-(void)btn:(UIButton *)btn
{
    if (self.delegate) {
        [self.delegate itemsSelected:btn.tag];
    }
}
@end
