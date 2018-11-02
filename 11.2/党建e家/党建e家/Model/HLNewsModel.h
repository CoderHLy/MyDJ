//
//  HLNewsModel.h
//  党建e家
//
//  Created by 何龙 on 2018/10/26.
//  Copyright © 2018 何龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HLNewsModel : NSObject
@property (nonatomic, strong) NSString *newsId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *titleDesc;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *currentTime;
@property (nonatomic, strong) NSString *updateTime;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *count;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *isScan;
@end

NS_ASSUME_NONNULL_END
