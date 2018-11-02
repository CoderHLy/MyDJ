//
//  WSClodeIntTableViewCell.m
//  党建e家
//
//  Created by Sunweisheng on 2018/11/1.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import "WSClodeIntTableViewCell.h"
#import "CloudeModel.h"
#import "UIImageView+AFNetworking.h"
@implementation WSClodeIntTableViewCell{
    UIImageView *_headerImgView;
    UILabel *_nameLab;
    UIImageView *_clockImgView;
    UILabel *_timeLab;
    UIImageView *_voiceView;
    UIImageView *_intraImgView;
    UILabel *_contentLab;
    UIButton *_replyBtn;
    UIImageView *_messageImgView;
    UILabel *_typeLab;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //图像
        _headerImgView = [UIImageView imageName:@"head" superView:self.contentView touch:YES];
        _headerImgView.layer.cornerRadius = 15;
        _headerImgView.layer.masksToBounds = YES;
        [_headerImgView makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(10);
            make.width.height.equalTo(30);
        }];
        
        //用户名
        _nameLab = [UILabel labelWithText:@"666" alignment:NSTextAlignmentLeft textColor:[UIColor whiteColor] font:16 superView:self.contentView];
        [_nameLab makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(10);
            make.left.equalTo(self->_headerImgView.right).offset(10);
            make.width.equalTo(100);
            make.height.equalTo(16);
        }];
        
        //小时钟
        _clockImgView = [UIImageView imageName:@"time" superView:self.contentView touch:NO];
        [_clockImgView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->_nameLab.bottom).offset(8);
            make.left.equalTo(self->_headerImgView.right).offset(10);
            make.width.height.equalTo(10);
        }];
        
        //时间lab
        _timeLab = [UILabel labelWithText:@"2018-10-31" alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:12.0 superView:self.contentView];
        [_timeLab makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self->_clockImgView.right).equalTo(6);
            make.top.equalTo(self->_nameLab.bottom).offset(8);
            make.height.equalTo(10);
            make.width.equalTo(120);
        }];
        
        //小喇叭
        _voiceView = [UIImageView imageName:@"sound" superView:self.contentView touch:NO];
        [_voiceView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->_nameLab.bottom).offset(8);
            make.left.equalTo(self->_timeLab.right).offset(8);
            make.width.height.equalTo(10);
        }];
        
        //类型lab
        _typeLab = [UILabel labelWithText:@"公开" alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:12.0 superView:self.contentView];
        [_typeLab makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self->_voiceView.right).equalTo(6);
            make.top.equalTo(self->_nameLab.bottom).offset(8);
            make.height.equalTo(10);
            make.width.equalTo(30);
        }];
        
        //党员互动
        _intraImgView = [UIImageView imageWithImage:@"interaction_icon" subView:self.contentView];
        [_intraImgView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(10);
            make.right.equalTo(-15);
            make.width.equalTo(60);
            make.height.equalTo(20);
        }];
        
        //内容
        _contentLab = [UILabel labelWithText:@"呵呵呵呵" alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:13.0 superView:self.contentView];
        [_contentLab makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->_timeLab.bottom).offset(10);
            make.left.equalTo(15);
            make.width.equalTo(SCREENWIDTH - 30);
            make.height.equalTo(30);
        }];
        
        //回复
        _replyBtn = [UIButton btnWithBGcolor:[UIColor clearColor] settitle:@"回复" Font:13.0 cornerRadius:0 masksToBounds:NO superView:self.contentView section:@selector(replyMethod) Target:self settitlecolor:[UIColor blackColor]];
        _replyBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [_replyBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->_contentLab.bottom).offset(10);
            make.right.equalTo(-15);
            make.width.equalTo(60);
            make.height.equalTo(15);
        }];
        
        //消息图标
        _messageImgView = [UIImageView imageWithImage:@"message" subView:self.contentView];
        [_messageImgView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->_contentLab.bottom).offset(10);
            make.right.equalTo(self->_replyBtn.right).offset(-35);
            make.width.equalTo(15);
            make.height.equalTo(15);
        }];
    }
    return self;
}

-(void)setModel:(CloudeModel *)obj
{
    [_headerImgView setImageWithURL:[NSURL URLWithString:obj.header] placeholderImage:[UIImage imageNamed:@"head"]];
    _nameLab.text = obj.username;
    _timeLab.text = [self forMatterTime:[NSString stringWithFormat:@"%@" ,obj.createTime]];
    _contentLab.text = obj.content;
    if (obj.isPriv == 0) {
        _typeLab.text = @"公开";
    }
    else
    {
        _typeLab.text = @"私密";
    }
}
-(void)replyMethod
{
    NSLog(@"@@@@@@@@回复一下@@@@@@@@@@");
}

//转换时间戳
-(NSString *)forMatterTime:(NSString *)str
{
    NSString *timeStampString = str;
    // iOS 生成的时间戳是10位
    NSTimeInterval interval =[timeStampString doubleValue] / 1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString       = [formatter stringFromDate: date];
//    NSLog(@"服务器返回的时间戳对应的时间是:%@",dateString);
    return dateString;
}

@end
