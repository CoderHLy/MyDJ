//
//  HLLifeView.h
//  党建e家
//
//  Created by 何龙 on 2018/10/26.
//  Copyright © 2018 何龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol HLLifeViewDelegate <NSObject>
//点击五个btn响应的方法
-(void)ItemDidClicked:(NSInteger)tag;


@end
@interface HLLifeView : UIView
@property (nonatomic, weak) id<HLLifeViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
