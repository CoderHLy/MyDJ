//
//  MyDjHeadView.h
//  党建e家
//
//  Created by Sunweisheng on 2018/10/25.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyDjHeadView : UIView

@property (nonatomic,strong) UIImageView *backImgView;
@property (nonatomic,strong) UIButton *headImgBtn;
@property (nonatomic,strong) UILabel *userNameLab;

typedef void(^MyDjHeadViewBlock)(MyDjHeadView *headView);
@property (nonatomic,copy)MyDjHeadViewBlock djBlock;

@end

NS_ASSUME_NONNULL_END
