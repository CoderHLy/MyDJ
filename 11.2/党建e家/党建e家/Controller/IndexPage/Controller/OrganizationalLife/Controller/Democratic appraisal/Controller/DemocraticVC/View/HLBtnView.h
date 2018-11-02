//
//  HLBtnView.h
//  党建e家
//
//  Created by 何龙 on 2018/11/1.
//  Copyright © 2018 何龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol HLBtnViewDelegate <NSObject>

-(void)itemsSelected:(NSInteger)tag;

@end
@interface HLBtnView : UIView
@property (nonatomic, weak) id<HLBtnViewDelegate>delegate;

-(id)initWithFrame:(CGRect)frame
       andTitleArr:(NSMutableArray *)titleArr;
@end

NS_ASSUME_NONNULL_END
