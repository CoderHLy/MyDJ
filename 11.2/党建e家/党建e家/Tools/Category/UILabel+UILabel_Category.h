//
//  UILabel+UILabel_Category.h
//  党建e家
//
//  Created by 何龙 on 2018/10/25.
//  Copyright © 2018 何龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (UILabel_Category)
+(UILabel *)labelWithText:(NSString *)text
                alignment:(NSTextAlignment)alignment
                textColor:(UIColor *)color
                     font:(CGFloat)font
                superView:(UIView *)superView;
//何龙   弹窗式动画label
+(UILabel *)labelWithText:(NSString *)text
                superView:(UIView *)superView;
@end

NS_ASSUME_NONNULL_END
