//
//  HLDemocraticViewModel.m
//  党建e家
//
//  Created by 何龙 on 2018/11/1.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HLDemocraticViewModel.h"
#import "HLBranchListModel.h"
#define BASEURL @"http://211.67.177.56:8080/hhdj/"
@implementation HLDemocraticViewModel{
    AFHTTPSessionManager *_manager;
    NSMutableArray *_getListArr;
}
-(id)init
{
    self = [super init];
    if (self) {
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BASEURL]];
        _getListArr = [NSMutableArray array];
    }
    return self;
}
-(void)getListCallBack:(HLGetListBlock)block
{
    [_manager POST:@"branch/findAll.do" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"list.responseObject = %@", responseObject);
        self->_getListArr = [AssignToObject customModel:@"HLBranchListModel" ToArray:[responseObject objectForKey:@"rows"]];
        NSLog(@"getListArr = %@", self->_getListArr);
        block(self->_getListArr);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@", error);
    }];
}
@end
