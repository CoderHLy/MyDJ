//
//  UILabel+UILabel_Category.m
//  党建e家
//
//  Created by 何龙 on 2018/10/25.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "UILabel+UILabel_Category.h"

@implementation UILabel (UILabel_Category)
#pragma mark - 何龙。
+(UILabel *)labelWithText:(NSString *)text
                alignment:(NSTextAlignment)alignment
                textColor:(UIColor *)color
                     font:(CGFloat)font
                superView:(UIView *)superView
{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.numberOfLines = 0;
    label.textAlignment = alignment;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:font];
    [superView addSubview:label];
    return label;
}
#pragma mark - 何龙，弹窗式动画label
+(UILabel *)labelWithText:(NSString *)text superView:(UIView *)superView
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(SCREENWIDTH / 2 - 50, SCREENHEIGHT, 100, 30)];
    label.text = text;
    label.layer.cornerRadius = 5;
    label.font = [UIFont systemFontOfSize:14];
    label.layer.masksToBounds = YES;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [Color(30, 28, 30) colorWithAlphaComponent:0.7];
    label.textColor = [UIColor whiteColor];
    [superView addSubview:label];
    [UIView animateWithDuration:1.5 animations:^{
        label.frame = CGRectMake(SCREENWIDTH / 2 - 50, SCREENHEIGHT / 2 - 15, 100, 30);
    } completion:^(BOOL finished) {
        [label removeFromSuperview];
    }];
    return label;
}
@end
