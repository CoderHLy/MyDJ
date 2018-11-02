//
//  UIViewController+UIViewController_Category.m
//  党建e家
//
//  Created by 何龙 on 2018/10/25.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "UIViewController+UIViewController_Category.h"

@implementation UIViewController (UIViewController_Category)
-(void)viewDidLoad{
    //消除naviga的色差，默认从navigation下开始布局
    self.navigationController.navigationBar.translucent = NO;
}
@end
