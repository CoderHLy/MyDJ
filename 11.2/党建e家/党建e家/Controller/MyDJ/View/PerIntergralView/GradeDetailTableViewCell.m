//
//  GradeDetailTableViewCell.m
//  党建e家
//
//  Created by Sunweisheng on 2018/10/27.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import "GradeDetailTableViewCell.h"
#import "GradeDetailModel.h"
@implementation GradeDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _typeNaLab = [UILabel labelWithText:@"查看新闻眼" alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:14 superView:self.contentView];
        _typeNaLab.backgroundColor = [UIColor greenColor];
        [_typeNaLab makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(10);
            make.width.equalTo(100);
            make.height.equalTo(20);
        }];
        
        _timeLab = [UILabel labelWithText:@"2018-10-27" alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:14 superView:self.contentView];
        _timeLab.backgroundColor = [UIColor greenColor];
        [_timeLab makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.typeNaLab.bottom).offset(10);
            make.left.equalTo(10);
            make.width.equalTo(180);
            make.height.equalTo(20);
        }];
        
        _singleDescLab = [UILabel labelWithText:@"+0.1" alignment:NSTextAlignmentCenter textColor:[UIColor blackColor] font:14 superView:self.contentView];
        _singleDescLab.backgroundColor = [UIColor greenColor];
        [_singleDescLab makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(10);
            make.right.equalTo(-10);
            make.width.equalTo(50);
            make.height.equalTo(20);
        }];
        
    }
    return self;
}

-(void)setModel:(GradeDetailModel *)obj
{
    self.typeNaLab.text = obj.typeName;
    self.timeLab.text = obj.timeFormat;
    self.singleDescLab.text = [NSString stringWithFormat:@"+%.1f", obj.singleDesc];
}

@end
