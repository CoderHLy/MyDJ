//
//  HLBannerViewModel.m
//  党建e家
//
//  Created by 何龙 on 2018/10/25.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HLBannerViewModel.h"
#import "HLBannerModel.h"
#define URL @"http://211.67.177.56:8080/hhdj/carousel/carouselList.do?type=0"
@implementation HLBannerViewModel{
    AFHTTPSessionManager *_manager;
    NSMutableArray *_arr;
}
-(void)getBannerArr:(HLBannerBlock)bannerBlock{
    _arr = [NSMutableArray array];
    _manager = [[AFHTTPSessionManager alloc] init];
    [_manager GET:URL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"obj = %@", responseObject);
        self->_arr = [AssignToObject customModel:@"HLBannerModel" ToArray:[responseObject objectForKey:@"rows"]];
        NSLog(@"arr = %@", self->_arr);
        bannerBlock(self->_arr);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@", error);
    }];
}

@end
