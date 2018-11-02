//
//  CommonClass.m
//  党建e家
//
//  Created by Sunweisheng on 2018/10/30.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import "CommonClass.h"

@implementation CommonClass

+(void)showAlertWithMessage:(NSString *)msg{
    
    UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:nil
                                                       message:msg
                                                      delegate:nil
                                             cancelButtonTitle:@"确定"
                                             otherButtonTitles:nil];
    [alertView show];
}


@end
