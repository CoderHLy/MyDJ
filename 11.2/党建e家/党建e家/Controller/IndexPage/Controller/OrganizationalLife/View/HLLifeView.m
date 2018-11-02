//
//  HLLifeView.m
//  党建e家
//
//  Created by 何龙 on 2018/10/26.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HLLifeView.h"

@implementation HLLifeView{
    UIImageView *_imageView;
}
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加首页图片
        _imageView = [UIImageView imageWithImage:@"banner1" subView:self];
        [_imageView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(0);
            make.top.equalTo(0);
            make.size.equalTo(CGSizeMake(SCREENWIDTH, SCREENHEIGHT / 3));
        }];
        NSArray *textArr = @[@"政治学习",
                             @"思想汇报",
                             @"心得总结",
                             @"民主评议",
                             @"流动党员找组织"];
        for (int i = 0; i < 5; ++i) {
            //添加btn
            UIButton *btn = [UIButton buttonWithTag:i Target:self selector:@selector(btnSelected:) superView:self];
            [btn makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo((SCREENWIDTH / 3) * (i % 3));
                make.top.equalTo((SCREENHEIGHT / 6) * (i / 3) + SCREENHEIGHT / 3);
                make.size.equalTo(CGSizeMake(SCREENWIDTH / 3, SCREENHEIGHT / 6));
            }];
            
            //为btn添加图片
            UIImageView *imgView = [UIImageView imageName:[NSString stringWithFormat:@"icon%d", i + 1] superView:btn touch:NO];
            [imgView makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(btn.centerX);
                make.centerY.equalTo(btn.centerY).offset(-10);
                make.size.equalTo(CGSizeMake(SCREENWIDTH / 6, SCREENWIDTH / 6));
            }];
            //为btn添加文字
            UILabel *label = [UILabel labelWithText:textArr[i] alignment:NSTextAlignmentCenter textColor:[UIColor grayColor] font:12 superView:btn];
            label.numberOfLines = 2;
            [label makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(btn.centerX);
                make.top.equalTo(imgView.bottom).offset(0);
                make.size.equalTo(CGSizeMake(SCREENWIDTH / 6, 30));
            }];
        }
    }
    return self;
}

#pragma mark - delegate
-(void)btnSelected:(UIButton *)btn
{
    if (self.delegate) {
        [self.delegate ItemDidClicked:btn.tag];
    }
}
@end
