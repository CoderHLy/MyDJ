//
//  HLLIstTableViewModel.m
//  党建e家
//
//  Created by 何龙 on 2018/11/1.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HLLIstTableViewModel.h"
#define BASEURL @"http://211.67.177.56:8080/hhdj/nationComment/"
@implementation HLLIstTableViewModel{
    NSMutableArray *_getArr;
    NSString *_id;
    AFHTTPSessionManager *_manager;
}
-(void)getListWithBranch_id:(NSString *)branch callBack:(HLListCallBack)callBack
{
    _id = branch;
    _getArr = [NSMutableArray array];
    _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BASEURL]];
    [_manager GET:[NSString stringWithFormat:@"userList.do?rows=0&select_branch=%@", _id] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseobj = %@", responseObject);
        self->_getArr = [AssignToObject customModel:@"HLListModel" ToArray:[responseObject objectForKey:@"rows"]];
        callBack(self->_getArr);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@", error);
    }];
}
@end
