//
//  HLNavigationViewController.m
//  党建e家
//
//  Created by 何龙 on 2018/10/25.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HLNavigationViewController.h"

@interface HLNavigationViewController ()

@end

@implementation HLNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏颜色
    self.navigationBar.barTintColor = Color(182, 0, 10);
    
    //设置导航栏标题字体颜色
    self.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
}

//重写push方法
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:YES];
    if(self.viewControllers.count > 1)
    {
        //显示navigation导航栏
        viewController.navigationController.navigationBar.hidden = NO;
        viewController.tabBarController.tabBar.hidden = YES;
        //导航返回按钮
        UIButton *leftBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [leftBtn setImage:[UIImage imageNamed:@"news_back_btn"] forState:(UIControlStateNormal)];
        [leftBtn setImage:[UIImage imageNamed:@"news_back_btn"] forState:(UIControlStateHighlighted)];
        [leftBtn addTarget:self action:@selector(leftBtnSelected) forControlEvents:(UIControlEventTouchUpInside)];
        leftBtn.frame = CGRectMake(0, 0, 25, 25);
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    }
}

-(void)leftBtnSelected
{
    [self popViewControllerAnimated:YES];
}

//重写pop方法
-(UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    [super popViewControllerAnimated:YES];
    if(self.viewControllers.count == 1)
    {
        //显示tarbar
        self.tabBarController.tabBar.hidden = NO;
    }
    return self;
}


@end
