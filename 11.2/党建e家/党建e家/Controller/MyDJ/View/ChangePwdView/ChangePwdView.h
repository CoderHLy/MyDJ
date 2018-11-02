//
//  ChangePwdView.h
//  党建e家
//
//  Created by Sunweisheng on 2018/10/26.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChangePwdView : UIView

@property (nonatomic, strong)UILabel*titleLabel;
@property (nonatomic, strong)NSArray *array;

@property (nonatomic, strong)UITextField *oldPwdField;
@property (nonatomic, strong)UITextField *OneNewPwdField;
@property (nonatomic, strong)UITextField *sureNewPwdField;

@property (nonatomic, strong)UIButton *sureBtn;
//修改密码block跳转
typedef void(^changePwdBlock)(ChangePwdView *myBlock);
@property (nonatomic, strong)changePwdBlock block;

@end

NS_ASSUME_NONNULL_END
