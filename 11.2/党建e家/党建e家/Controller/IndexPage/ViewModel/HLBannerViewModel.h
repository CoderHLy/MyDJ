//
//  HLBannerViewModel.h
//  党建e家
//
//  Created by 何龙 on 2018/10/25.
//  Copyright © 2018 何龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^HLBannerBlock)(NSMutableArray *arr);

@interface HLBannerViewModel : NSObject
-(void)getBannerArr:(HLBannerBlock)bannerBlock;
@end

NS_ASSUME_NONNULL_END
