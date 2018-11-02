//
//  HLLifeViewController.m
//  党建e家
//
//  Created by 何龙 on 2018/10/26.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HLLifeViewController.h"
#import "HLLifeView.h"
#import "HLNewsViewController.h"
#import "HLDemocraticIndexVC.h"
@interface HLLifeViewController ()<HLLifeViewDelegate>

@end

@implementation HLLifeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone | UIRectEdgeBottom;
    HLLifeView *lifeView = [[HLLifeView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT - 100)];
    lifeView.delegate = self;
    [self.view addSubview:lifeView];
}

#pragma mark - HLLifeDelegate方法
-(void)ItemDidClicked:(NSInteger)tag
{
    NSLog(@"itemSelected.tag = %ld", tag);
    HLNewsViewController *NewsVC = [[HLNewsViewController alloc] init];
    switch (tag) {
        case 0:
            NewsVC.title = @"政治学习";
            NewsVC.urlType = @"8";
            [self.navigationController pushViewController:NewsVC animated:YES];
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            [self.navigationController pushViewController:[[HLDemocraticIndexVC alloc] init] animated:YES];
            break;
        case 4:
            
            break;
            
        default:
            break;
    }
}

@end
