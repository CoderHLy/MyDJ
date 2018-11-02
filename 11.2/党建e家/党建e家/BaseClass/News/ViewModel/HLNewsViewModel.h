//
//  HLNewsViewModel.h
//  党建e家
//
//  Created by 何龙 on 2018/10/26.
//  Copyright © 2018 何龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^HLNewsBlock)(NSMutableArray *arr);
@interface HLNewsViewModel : NSObject

-(void)getObjArr:(HLNewsBlock)block
            type:(NSString *)type;
@end

NS_ASSUME_NONNULL_END
