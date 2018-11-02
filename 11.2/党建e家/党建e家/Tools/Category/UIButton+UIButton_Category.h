//
//  UIButton+UIButton_Category.h
//  党建e家
//
//  Created by 何龙 on 2018/10/25.
//  Copyright © 2018 何龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (UIButton_Category)
+(UIButton *)buttonWithTag:(NSInteger)tag
                    Target:(id)target
                  selector:(SEL)action
                 superView:(UIView *)superView;

+(UIButton *)btnWithBGcolor:(UIColor *)color
                   settitle:(NSString *)title
                       Font:(CGFloat)font
               cornerRadius:(NSInteger)corner
              masksToBounds:(BOOL)mask
                  superView:(nonnull UIView *)superView
                    section:(SEL)action
                     Target:(id)target
              settitlecolor:(UIColor *)titlecorol;

+(UIButton *)buttonWithTitle:(NSString *)title
                      Target:(id)target
                    selector:(SEL)action
                   superView:(UIView *)superView;
@end

NS_ASSUME_NONNULL_END
