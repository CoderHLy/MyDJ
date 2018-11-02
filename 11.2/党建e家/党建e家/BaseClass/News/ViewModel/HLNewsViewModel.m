//
//  HLNewsViewModel.m
//  党建e家
//
//  Created by 何龙 on 2018/10/26.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HLNewsViewModel.h"


@implementation HLNewsViewModel{
    AFHTTPSessionManager *_manager;
    NSMutableArray *_arr;
}

-(void)getObjArr:(HLNewsBlock)block type:(NSString *)type
{
    _arr = [NSMutableArray array];
    _manager = [[AFHTTPSessionManager alloc] init];
    NSDictionary *dic = @{@"page":@"1",
                          @"rows":@"10",
                          @"type":type};
    [_manager POST:@"http://211.67.177.56:8080/hhdj/news/newsList.do" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self->_arr = [AssignToObject customModel:@"HLNewsModel" ToArray:[responseObject objectForKey:@"rows"]];
        NSLog(@"response = %@", responseObject);
        block(self->_arr);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@", error);
    }];
}

@end
