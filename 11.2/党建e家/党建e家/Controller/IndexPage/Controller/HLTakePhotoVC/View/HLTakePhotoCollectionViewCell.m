//
//  HLTakePhotoCollectionViewCell.m
//  党建e家
//
//  Created by 何龙 on 2018/10/26.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HLTakePhotoCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"
@implementation HLTakePhotoCollectionViewCell{
    UIImageView *_imageView;
    UILabel *_label;
}
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //初始化图片
        _imageView = [UIImageView imageWithImage:@"" subView:self.contentView];
        [_imageView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(10);
            make.size.equalTo(CGSizeMake(SCREENWIDTH / 2 - 20, SCREENWIDTH / 2 - 60));
        }];
        
        _label = [UILabel labelWithText:@"" alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:14 superView:self.contentView];
        _label.numberOfLines = 2;
        [_label makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(self->_imageView.bottom);
            make.size.equalTo(CGSizeMake(SCREENWIDTH / 2 - 20, 35));
        }];
    }
    return self;
}
-(void)setModel:(HLNewsModel *)obj
{
    [_imageView setImageWithURL:[NSURL URLWithString:obj.pic]];
    _label.text = obj.title;
}
@end
