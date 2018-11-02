//
//  HLListTableViewCell.m
//  党建e家
//
//  Created by 何龙 on 2018/11/1.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HLListTableViewCell.h"
#import "UIImageView+AFNetworking.h"
@implementation HLListTableViewCell{
    UIImageView *_headImageView;
    UILabel *_nameLabel;
    UILabel *_branchLabel;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initItems];
    }
    return self;
}
#pragma mark - 初始化样式
-(void)initItems
{
    //设置头像样式
    _headImageView = [UIImageView imageWithImage:@"Head_12.jpg" subView:self.contentView];
    _headImageView.layer.cornerRadius = 30;
    _headImageView.layer.masksToBounds = YES;
    [_headImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(10);
        make.top.equalTo(10);
        make.size.equalTo(CGSizeMake(60, 60));
    }];
    //设置名字样式
    _nameLabel = [UILabel labelWithText:@"" alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:14 superView:self.contentView];
    [_nameLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_headImageView.right).offset(14);
        make.top.equalTo(self.top).offset(25);
        make.size.equalTo(CGSizeMake(70, 30));
    }];
    //设置list名称label
    _branchLabel = [UILabel labelWithText:@"" alignment:NSTextAlignmentRight textColor:[UIColor blackColor] font:14 superView:self.contentView];
    [_branchLabel makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.right).offset(-5);
        make.top.equalTo(self.top).offset(25);
        make.size.equalTo(CGSizeMake(SCREENWIDTH - 100, 30));
    }];
}
#pragma mark - cell赋值方法
-(void)setModel:(HLListModel *)obj
{
    [_headImageView setImageWithURL:[NSURL URLWithString:obj.header] placeholderImage:[UIImage imageNamed:@"Head_12.jpg"]];
    _nameLabel.text = obj.username;
    _branchLabel.text = obj.branchName;
}
@end
