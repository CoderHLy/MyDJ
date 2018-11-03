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
    MHProgress *_tips;
}

-(void)getObjArr:(HLNewsBlock)block type:(NSString *)type
{
    [self addTips];
    _arr = [NSMutableArray array];
    _manager = [[AFHTTPSessionManager alloc] init];
    NSDictionary *dic = @{@"page":@"1",
                          @"rows":@"10",
                          @"type":type};
    [_manager POST:@"http://211.67.177.56:8080/hhdj/news/newsList.do" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self->_arr = [AssignToObject customModel:@"HLNewsModel" ToArray:[responseObject objectForKey:@"rows"]];
        NSLog(@"response = %@", responseObject);
        [self->_tips closeLoadingView];
        block(self->_arr);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@", error);
    }];
}
#pragma mark - 添加加载动画
-(void)addTips
{
    NSLog(@"show");
    _tips = [[MHProgress alloc] initWithType:MHPopViewTypeWrapContentWithTips failedBlock:^(){
        NSLog(@"加载失败");
    }];
    [_tips showLoadingView];
    //    [_tips closeLoadingView]; // 关闭
}
@end
