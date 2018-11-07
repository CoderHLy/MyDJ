//
//  CloudeDatSouProtocol.h
//  党建e家
//
//  Created by Sunweisheng on 2018/11/1.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WSClodeIntTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN
//双层代理2
@protocol DataDelegate <NSObject>

-(void)jump;

@end
@interface CloudeDatSouProtocol : NSObject<UITableViewDataSource,CellDelegate>

@property (nonatomic,weak)id<DataDelegate> delegate;

@property (nonatomic,strong) NSMutableArray *cloudeDatSourceArr;

@end

NS_ASSUME_NONNULL_END
