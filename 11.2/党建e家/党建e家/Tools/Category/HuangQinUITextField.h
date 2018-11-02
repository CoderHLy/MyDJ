//
//  HuangQinUITextField.h
//  党建e家
//
//  Created by 黄钦 on 2018/10/26.
//  Copyright © 2018 何龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HuangQinUITextField : UITextField
-(UITextField *)dic:(NSMutableDictionary *)attributes superView:(nonnull UIView *)superView text:(NSString *)text color:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
