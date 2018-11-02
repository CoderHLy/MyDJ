//
//  UIButton+UIButton_Category.m
//  党建e家
//
//  Created by 何龙 on 2018/10/25.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "UIButton+UIButton_Category.h"

@implementation UIButton (UIButton_Category)
#pragma mark - 何龙。首页
+(UIButton *)buttonWithTag:(NSInteger)tag
                    Target:(id)target
                  selector:(SEL)action
superView:(nonnull UIView *)superView
{
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.tag = tag;
    [btn addTarget:target action:action forControlEvents:(UIControlEventTouchUpInside)];
    [superView addSubview:btn];
    return btn;
}

+(UIButton *)btnWithBGcolor:(UIColor *)color settitle:(NSString *)title Font:(CGFloat)font cornerRadius:(NSInteger)corner masksToBounds:(BOOL)mask superView:(nonnull UIView *)superView section:(SEL)action Target:(id)target settitlecolor:(UIColor *)titlecorol
{
    UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = color;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titlecorol forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    btn.layer.cornerRadius = corner;
    btn.layer.masksToBounds = mask;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:btn];
    return btn;
}
//何龙
+(UIButton *)buttonWithTitle:(NSString *)title
                      Target:(id)target
                    selector:(SEL)action
                   superView:(nonnull UIView *)superView
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.textColor = [UIColor whiteColor];
    btn.backgroundColor = [UIColor redColor];
    btn.layer.cornerRadius = 6;
    btn.layer.masksToBounds = YES;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:btn];
    return btn;
}
@end
