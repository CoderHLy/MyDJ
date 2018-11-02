//
//  HLPersonageView.m
//  党建e家
//
//  Created by 何龙 on 2018/11/1.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HLPersonageView.h"

@implementation HLPersonageView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initBtn];
    }
    return self;
}
#pragma mark - 提交审核事件
-(void)initBtn
{
    UIButton *btn = [UIButton buttonWithTitle:@"提交审核" Target:self selector:@selector(btnSelected) superView:self];
    [btn makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.centerX);
        make.centerY.equalTo(self.centerY);
        make.size.equalTo(CGSizeMake(SCREENWIDTH, 70));
    }];
}
-(void)btnSelected
{
    if (self.delegate) {
        [self.delegate btnSelect];
    }
}
@end
