//
//  ChargeViewController.m
//  党建e家
//
//  Created by Sunweisheng on 2018/10/26.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import "ChargeViewController.h"
#import "ChargeView.h"
@interface ChargeViewController ()<chargeDelegate>

@property (nonatomic,strong) ChargeView *chargeView;

@end

@implementation ChargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"收费缴纳";
    
    [self initChargeView];
}

-(void)initChargeView
{
    _chargeView = [[ChargeView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    _chargeView.delegate = self;
    [self.view addSubview:_chargeView];
}

- (void)chargeMoney:(NSInteger)tag
{
    switch (tag) {
        case 0:
        {
            NSLog(@"微信支付");
        }
            break;
        case 1:
        {
            NSLog(@"支付宝支付");
        }
            break;
            
        default:
            break;
    }
}

@end
