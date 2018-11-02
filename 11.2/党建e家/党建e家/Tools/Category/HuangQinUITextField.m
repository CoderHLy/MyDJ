//
//  HuangQinUITextField.m
//  党建e家
//
//  Created by 黄钦 on 2018/10/26.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HuangQinUITextField.h"

@implementation HuangQinUITextField
-(UITextField *)dic:(NSMutableDictionary *)attributes superView:(nonnull UIView *)superView text:(NSString *)text color:(UIColor *)color
{
    UITextField *textfile = [[UITextField alloc]init];
    attributes[NSForegroundColorAttributeName] = color;
    textfile.attributedPlaceholder = [[NSAttributedString alloc] initWithString:text attributes:attributes];
    [superView addSubview:textfile];
    textfile.font = [UIFont systemFontOfSize:13];
    return textfile;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return NO;
}
@end
