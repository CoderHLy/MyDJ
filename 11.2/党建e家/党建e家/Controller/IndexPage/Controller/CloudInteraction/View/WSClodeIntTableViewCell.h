//
//  WSClodeIntTableViewCell.h
//  党建e家
//
//  Created by Sunweisheng on 2018/11/1.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//双层代理1
@protocol CellDelegate <NSObject>

-(void)jump;

@end

@interface WSClodeIntTableViewCell : UITableViewCell
@property (nonatomic,weak)id<CellDelegate> delegate;

@property (nonatomic,strong) UIButton *replyBtn;;

-(void)setModel:(id)obj;

@end

NS_ASSUME_NONNULL_END
