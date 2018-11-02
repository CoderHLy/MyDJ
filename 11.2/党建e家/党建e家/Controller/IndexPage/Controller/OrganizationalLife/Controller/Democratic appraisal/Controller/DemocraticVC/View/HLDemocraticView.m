//
//  HLDemocraticView.m
//  党建e家
//
//  Created by 何龙 on 2018/11/1.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HLDemocraticView.h"
#import "HLDemocraticViewModel.h"
@implementation HLDemocraticView{
    UIButton *_chooseBtn;
    HLBtnView *_btnView;
    UILabel *_chooseLabel;
    NSMutableArray *_getListArr;
    NSString *_id;
}
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initContentLabel];
        [self initBtns];
    }
    return  self;
}
#pragma mark - 设置评议须知
-(void)initContentLabel
{
    NSArray *arr = @[@"1、坚定理想信念、贯彻执行党的路线方针政策情况；",
                     @"2、参加“两学一做“学习教育情况；",
                     @"3、参加党的组织生活、按要求缴纳党费；",
                     @"4、学习情况、业务能力提交情况；",
                     @"5、关心集体、团结同志，发挥先锋模范作用情况；",
                     @"6、联系群众、关心群众、服务群众情况；",
                     @"7、遵守党章党规、法律法规和学校规章制度情况。"];
    UILabel *titleLabel = [UILabel labelWithText:@"评论须知" alignment:NSTextAlignmentCenter textColor:[UIColor blackColor] font:18 superView:self];
    [titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(0);
        make.top.equalTo(20);
        make.size.equalTo(CGSizeMake(SCREENWIDTH, 20));
    }];
    UILabel *contentLabel = [UILabel labelWithText:@"在党支部专题组织生活会上，每一位党员要对照评议内容进行个人总结，查摆存在的问题，进行批评与自我批评，明确下一步的努力方向。在此基础上，党支部组织全体党员对每一位党员进行民主评议。评议主要内容如下:" alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:14 superView:self];
    contentLabel.numberOfLines = 0;
    contentLabel.backgroundColor = [UIColor redColor];
    [contentLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(8);
        make.top.equalTo(titleLabel.bottom).offset(20);
        make.size.equalTo(CGSizeMake(SCREENWIDTH - 16, 70));
    }];
    for (int i = 0; i < 7; i++) {
        UILabel *listLabel = [UILabel labelWithText:arr[i] alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:14 superView:self];
        listLabel.backgroundColor = [UIColor blueColor];
        [listLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(8);
            make.top.equalTo(contentLabel.bottom).offset(i * 20 + 10);
            make.size.equalTo(CGSizeMake(SCREENWIDTH - 16, 14));
        }];
    }
}

#pragma mark - initBtns
-(void)initBtns
{
    //添加选择按钮
    _chooseBtn = [UIButton buttonWithTitle:@"" Target:self selector:@selector(chooseBtn) superView:self];
    [_chooseBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(30);
        make.bottom.equalTo(self.bottom).offset(-70);
        make.size.equalTo(CGSizeMake(200, 40));
    }];
    _chooseLabel = [UILabel labelWithText:@"请选择" alignment:NSTextAlignmentLeft textColor:[UIColor whiteColor] font:12 superView:_chooseBtn];
    [_chooseLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_chooseBtn.left).offset(10);
        make.centerY.equalTo(self->_chooseBtn.centerY);
        make.size.equalTo(CGSizeMake(180, 40));
    }];
    //添加下一步按钮
    UIButton *btn = [UIButton buttonWithTitle:@"下一步" Target:self selector:@selector(next) superView:self];
    [btn makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(-30);
        make.bottom.equalTo(self.bottom).offset(-70);
        make.size.equalTo(CGSizeMake(70, 40));
    }];
    //添加选择框
    HLDemocraticViewModel *viewModel = [[HLDemocraticViewModel alloc] init];
    _getListArr = [NSMutableArray array];
    [viewModel getListCallBack:^(NSMutableArray * _Nonnull arr) {
        self->_getListArr = arr;
        self->_btnView = [[HLBtnView alloc] initWithFrame:CGRectZero andTitleArr:self->_getListArr];
        [self addSubview:self->_btnView];
        self->_btnView.hidden = YES;
        self->_btnView.delegate = self;
        [self->_btnView makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.bottom).offset(-20);
            make.left.equalTo(self->_chooseBtn.left);
            make.size.equalTo(CGSizeMake(300, 160));
        }];
    }];
}




#pragma mark - 点击事件
-(void)next
{
    if (!_id) {
        [UILabel labelWithText:@"伤害999+" superView:self];
    }
    else
    {
        if (self.delegate) {
            [self.delegate nextPageWithBranchId:_id];
        }
    }
}
-(void)chooseBtn
{
    _btnView.hidden = NO;
}
-(void)itemsSelected:(NSInteger)tag
{
    _chooseLabel.text = [_getListArr[tag] valueForKey:@"branch"];
    _id = [_getListArr[tag] valueForKey:@"id"];
    _btnView.hidden = YES;
}
@end
