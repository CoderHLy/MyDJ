//
//  TableViewDataSource.h
//  党建e家
//
//  Created by Sunweisheng on 2018/10/27.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewDataSource : NSObject<UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *tableViewDataSourceArr;

@end

NS_ASSUME_NONNULL_END
