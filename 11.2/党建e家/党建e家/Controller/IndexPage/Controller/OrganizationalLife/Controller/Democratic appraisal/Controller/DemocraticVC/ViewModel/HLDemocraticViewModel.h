//
//  HLDemocraticViewModel.h
//  党建e家
//
//  Created by 何龙 on 2018/11/1.
//  Copyright © 2018 何龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^HLGetListBlock) (NSMutableArray *arr);
@interface HLDemocraticViewModel : NSObject
-(void)getListCallBack:(HLGetListBlock)block;
@end

NS_ASSUME_NONNULL_END
