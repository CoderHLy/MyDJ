//
//  PerIntergralView.h
//  党建e家
//
//  Created by Sunweisheng on 2018/10/26.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol PerIntergralViewDelegate <NSObject>

-(void)jumpRuleVc;

@end
@interface PerIntergralView : UIView

@property (nonatomic,strong) UIImageView *leftImageView;
@property (nonatomic,strong) UILabel * textLab;
@property (nonatomic,strong) UIButton *rightBtn;
@property (nonatomic,strong) UIImageView *lineView;

@property (nonatomic,weak)id<PerIntergralViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
