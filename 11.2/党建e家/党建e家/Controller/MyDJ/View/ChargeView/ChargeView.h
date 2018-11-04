//
//  ChargeView.h
//  党建e家
//
//  Created by Sunweisheng on 2018/11/4.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol chargeDelegate <NSObject>

-(void)chargeMoney:(NSInteger)tag;

@end
@interface ChargeView : UIView

@property (nonatomic,weak) id<chargeDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
