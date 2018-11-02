//
//  CloudeModel.h
//  党建e家
//
//  Created by Sunweisheng on 2018/11/1.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CloudeModel : NSObject

@property (nonatomic, strong) NSString *forumId;
@property (nonatomic, strong) NSNumber *userId;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *header;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *currentTime;
@property (nonatomic, strong) NSNumber *commentCount;
@property (nonatomic, strong) NSNumber *isPriv;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSNumber *type;


@end

NS_ASSUME_NONNULL_END
