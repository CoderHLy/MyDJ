//
//  WSRuleViewModel.h
//  党建e家
//
//  Created by Sunweisheng on 2018/10/27.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^WSCallBack)(NSMutableArray* arr);

@interface WSRuleViewModel : NSObject

@property (nonatomic,strong) AFHTTPSessionManager *manager;

//返回积分规则请求的数据(get请求）WS
-(void)setRuleObj:(WSCallBack)block andStr:(NSString *)str;


//返回接口数据(post请求）WS
-(void)postWebData:(WSCallBack)block andUrlStr:(NSString *)url andDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
