//
//  GradeDetailModel.h
//  党建e家
//
//  Created by Sunweisheng on 2018/10/27.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GradeDetailModel : NSObject

@property (nonatomic,strong) NSString *typeName;
@property (nonatomic,assign) float singleDesc;
@property (nonatomic,strong) NSString *timeFormat;
@property (nonatomic,strong) NSString *id;
@property (nonatomic,assign) NSInteger userId;
@property (nonatomic,assign) NSUInteger type;
@property (nonatomic,assign) NSInteger curMax;
@property (nonatomic,assign) NSInteger maxNum;
@property (nonatomic,strong) NSString *createTime;
@property (nonatomic,strong) NSString *username;
@property (nonatomic,assign) NSInteger sex;
@property (nonatomic,assign) NSInteger totalScore;

@end

NS_ASSUME_NONNULL_END
