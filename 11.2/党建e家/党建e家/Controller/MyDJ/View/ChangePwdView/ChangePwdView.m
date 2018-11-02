//
//  ChangePwdView.m
//  党建e家
//
//  Created by Sunweisheng on 2018/10/26.
//  Copyright © 2018年 何龙. All rights reserved.
//
#define changePwdUrl @"http://211.67.177.56:8080/hhdj/user/updatePwd.do"

#import "ChangePwdView.h"
#import "WSRuleViewModel.h"
#import "CommonClass.h"
@implementation ChangePwdView

-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        _array = [NSArray arrayWithObjects:@"旧密码:", @"新密码:", @"确认新密码:", nil];
        [self layoutIfNeeded];
        float originY = 20;
        for(int i = 0; i < 3; ++i)
        {
            _titleLabel = [UILabel labelWithText:_array[i] alignment:NSTextAlignmentLeft textColor:[UIColor grayColor] font:14 superView:self];
            [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(originY);
                make.left.equalTo(40);
                make.height.equalTo(40);
                make.width.equalTo(120);
            }];
            
            [self layoutIfNeeded];
            originY = self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height + 40;
        }
        
        _oldPwdField = [[UITextField alloc] init];
        _oldPwdField.borderStyle = UITextBorderStyleRoundedRect;
        _oldPwdField.clearButtonMode = UITextFieldViewModeAlways;
        [self addSubview:_oldPwdField];
        [_oldPwdField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(60);
            make.left.equalTo(40);
            make.height.equalTo(40);
            make.width.equalTo(SCREENWIDTH - 80);
        }];
        
        _OneNewPwdField = [[UITextField alloc] init];
        _OneNewPwdField.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:_OneNewPwdField];
        [_OneNewPwdField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.oldPwdField.bottom).offset(40);
            make.left.equalTo(40);
            make.height.equalTo(40);
            make.width.equalTo(SCREENWIDTH - 80);
        }];
        
        _sureNewPwdField = [[UITextField alloc] init];
        _sureNewPwdField.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:_sureNewPwdField];
        [_sureNewPwdField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.OneNewPwdField.bottom).offset(40);
            make.left.equalTo(40);
            make.height.equalTo(40);
            make.width.equalTo(SCREENWIDTH - 80);
        }];
        //确认修改
        _sureBtn = [UIButton btnWithBGcolor:[UIColor redColor] settitle:@"确定" Font:18 cornerRadius:5 masksToBounds:YES superView:self section:@selector(changePwd) Target:self settitlecolor:[UIColor whiteColor]];
        [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(originY + 20);
            make.centerX.equalTo(self.centerX);
            make.height.equalTo(50);
            make.left.equalTo(40);
            make.width.equalTo(SCREENWIDTH - 80);
        }];
    }
    return self;
}

//修改密码事件
-(void)changePwd
{
    WSRuleViewModel *ruleViewModel = [[WSRuleViewModel alloc] init];
    __weak typeof(self) weakSelf = self;
    NSDictionary *changePwdDic = @{
                                   @"oldPwd":_oldPwdField.text,
                                   @"newPwd":_OneNewPwdField.text
                                   };
    [ruleViewModel postWebData:^(NSMutableArray * _Nonnull arr) {
//        NSLog(@"arr msg = %@", [arr valueForKey:@"msg"]);
        NSLog(@"sure= %@", weakSelf.sureNewPwdField.text);
        if ([[arr valueForKey:@"msg"] isEqualToString:@"密码修改成功"] && (weakSelf.OneNewPwdField.text = weakSelf.sureNewPwdField.text))
        {
            [CommonClass showAlertWithMessage:[arr valueForKey:@"msg"]];
            //block跳转控制器 这里应该是点击确定之后调转控制器。
            if(weakSelf.block)
            {
                weakSelf.block(self);
            }
        }else
        {
            if((weakSelf.OneNewPwdField.text != weakSelf.sureNewPwdField.text))
            {
                [CommonClass showAlertWithMessage:@"旧密码与新密码不同"];
            }
            else
            [CommonClass showAlertWithMessage:[arr valueForKey:@"msg"]];
        }
    } andUrlStr:changePwdUrl andDic:changePwdDic];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

@end
