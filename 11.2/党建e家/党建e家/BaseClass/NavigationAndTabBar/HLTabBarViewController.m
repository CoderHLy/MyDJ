//
//  HLTabBarViewController.m
//  党建e家
//
//  Created by 何龙 on 2018/10/25.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HLTabBarViewController.h"
#import "HLNavigationViewController.h"
#import "HLMyDJViewController.h"
#import "HLNewsViewController.h"
#import "HLIndexPageViewController.h"
@interface HLTabBarViewController ()

@end

@implementation HLTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.barTintColor = [UIColor whiteColor];
    
    //设置第一个页面--------------------
    HLNavigationViewController *naV1 = [[HLNavigationViewController alloc] initWithRootViewController:[[HLIndexPageViewController alloc] init]];
    [self setTabBarUINavigation:naV1 andTitleName:@"首页" andImgName:@"party_gray" andSelectedImgName:@"party_red"];
    [self addChildViewController:naV1];
    
    //设置第二个页面--------------------
    HLNewsViewController *tempVC = [[HLNewsViewController alloc] init];
    tempVC.title = @"通知早知道";
    tempVC.urlType = @"2";
    HLNavigationViewController *naV2 = [[HLNavigationViewController alloc] initWithRootViewController:tempVC];
    [self setTabBarUINavigation:naV2 andTitleName:@"通知早知道" andImgName:@"msg_gray" andSelectedImgName:@"msg_red"];
    [self addChildViewController:naV2];
    
    //设置第三个页面--------------------
    HLNavigationViewController *naV3 = [[HLNavigationViewController alloc] initWithRootViewController:[[HLMyDJViewController alloc] init]];
    [self setTabBarUINavigation:naV3 andTitleName:@"我的党建" andImgName:@"vip_gray" andSelectedImgName:@"vip_red"];
    [self addChildViewController:naV3];
    
    self.selectedIndex = 0;
}

//自定义方法，设置tabbar相关属性-----------------------------------------------------------------------------
-(void)setTabBarUINavigation:(UINavigationController *)naV andTitleName:(NSString *)title andImgName:(NSString *)name andSelectedImgName:(NSString *)selectedName
{
    naV.tabBarItem.title = title;
    //设置正常状态下的tabbar title颜色和字体大小
    [naV.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:12.0], NSFontAttributeName, nil] forState:(UIControlStateNormal)];
    //设置选中状态下的tabbar title颜色和字体大小
    [naV.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:12.0], NSFontAttributeName, nil] forState:(UIControlStateSelected)];
    
    //设置正常状态下的tabbar图标
    naV.tabBarItem.image = [[UIImage imageNamed:name] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    //设置选中状态下的tabbar图标
    naV.tabBarItem.selectedImage = [[UIImage imageNamed:selectedName] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
}


@end
