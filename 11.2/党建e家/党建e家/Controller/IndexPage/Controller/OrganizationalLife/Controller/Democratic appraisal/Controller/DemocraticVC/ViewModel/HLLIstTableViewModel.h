//
//  HLLIstTableViewModel.h
//  党建e家
//
//  Created by 何龙 on 2018/11/1.
//  Copyright © 2018 何龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HLListModel.h"
NS_ASSUME_NONNULL_BEGIN
typedef void (^HLListCallBack) (NSMutableArray *arr);
@interface HLLIstTableViewModel : NSObject
-(void)getListWithBranch_id:(NSString *)branch
                   callBack:(HLListCallBack)callBack;
@end

NS_ASSUME_NONNULL_END
