//
//  HLIndexBodyView.h
//  党建e家
//
//  Created by 何龙 on 2018/10/25.
//  Copyright © 2018 何龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol HLIndexBodyViewDelegate <NSObject>
//点击头部六个btn响应的方法
-(void)headerItemDidClicked:(NSInteger)tag;

//点击底部四个btn响应的方法
-(void)footerItemDidClicked:(NSInteger)tag;

@end

@interface HLIndexBodyView : UIView
@property (nonatomic, weak) id<HLIndexBodyViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
