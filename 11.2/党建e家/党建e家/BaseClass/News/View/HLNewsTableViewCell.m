//
//  HLNewsTableViewCell.m
//  党建e家
//
//  Created by 何龙 on 2018/10/26.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HLNewsTableViewCell.h"
#import "UIImageView+AFNetworking.h"
@implementation HLNewsTableViewCell{
    UIImageView *_imageView;
    UILabel *_titleLabel;
    UILabel *_timeLabel;
    UILabel *_countLabel;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initViews];
    }
    return self;
}
#pragma mark - 初始化控件
-(void)initViews
{
    //初始化imageView
    _imageView = [UIImageView imageWithImage:@"" subView:self.contentView];
    _imageView.backgroundColor = [UIColor redColor];
    [_imageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(10);
        make.top.equalTo(10);
        make.size.equalTo(CGSizeMake(80, 80));
    }];
    //初始化titleLabel
    _titleLabel = [UILabel labelWithText:@"" alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:16 superView:self.contentView];
    _titleLabel.numberOfLines = 2;
    [_titleLabel setFont:[UIFont systemFontOfSize:16 weight:0.5]];
    [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_imageView.right).offset(10);
        make.top.equalTo(15);
        make.size.equalTo(CGSizeMake(SCREENWIDTH - 120, 40));
    }];
    
    //初始化timeLabel
    _timeLabel = [UILabel labelWithText:@"" alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:12 superView:self.contentView];
    _timeLabel.backgroundColor = [UIColor orangeColor];
    [_timeLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_imageView.right).offset(10);
        make.bottom.equalTo(self.bottom).offset(-10);
        make.size.equalTo(CGSizeMake(130, 12));
    }];
    
    //初始化浏览数
    _countLabel = [UILabel labelWithText:@"" alignment:NSTextAlignmentRight textColor:[UIColor blackColor] font:12 superView:self.contentView];
    _countLabel.backgroundColor = [UIColor orangeColor];
    [_countLabel makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.right).offset(-10);
        make.bottom.equalTo(self.bottom).offset(-10);
        make.size.equalTo(CGSizeMake(30, 12));
    }];
    
    UIImageView *imageView = [UIImageView imageWithImage:@"news_eye" subView:self.contentView];
    [imageView makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_countLabel.left).offset(-5);
        make.bottom.equalTo(self.bottom).offset(-10);
        make.size.equalTo(CGSizeMake(17, 13));
    }];
}

//为cell赋值
-(void)setModel:(HLNewsModel *)obj
{
    [_imageView setImageWithURL:[NSURL URLWithString:obj.pic]];
    _titleLabel.text = obj.title;
    _timeLabel.text = obj.currentTime;
    _countLabel.text = [NSString stringWithFormat:@"%@", obj.count];
}
@end
