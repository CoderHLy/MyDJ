//
//  AddContentView.m
//  党建e家
//
//  Created by Sunweisheng on 2018/11/1.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import "AddContentView.h"

@implementation AddContentView{
    UIView *_contentView;
    UIButton *_announceBtn;
    UIButton *_cancleBtn;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = Color(241, 241, 241);
        [self addSubview:_contentView];
        [_contentView makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(0);
            make.left.equalTo(0);
            make.size.equalTo(CGSizeMake(SCREENWIDTH, 150));
        }];
        
        _textView = [[UITextView alloc] init];
        _textView.backgroundColor = [UIColor whiteColor];
        _textView.textColor = [UIColor blackColor];
        [_contentView addSubview:_textView];
        [_textView makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(10);
            make.size.equalTo(CGSizeMake(SCREENWIDTH - 20, 90));
        }];
        
        _announceBtn = [UIButton btnWithBGcolor:[UIColor redColor] settitle:@"发布" Font:12 cornerRadius:3 masksToBounds:YES superView:_contentView section:@selector(announceMethod) Target:self settitlecolor:[UIColor whiteColor]];
        [_announceBtn makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-10);
            make.left.equalTo(10);
            make.size.equalTo(CGSizeMake(40, 30));
        }];
        
        _cancleBtn = [UIButton btnWithBGcolor:[UIColor redColor] settitle:@"取消" Font:12 cornerRadius:3 masksToBounds:YES superView:_contentView section:@selector(calcleMethod) Target:self settitlecolor:[UIColor whiteColor]];
        [_cancleBtn makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-10);
            make.right.equalTo(-10);
            make.size.equalTo(CGSizeMake(40, 30));
        }];
    }
    return self;
}
-(void)announceMethod
{
    NSLog(@"发布按钮");
}
-(void)calcleMethod
{
    self.hidden = YES;
}
@end
