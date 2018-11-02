//
//  View.h
//  党建e家
//
//  Created by 黄钦 on 2018/10/25.
//  Copyright © 2018 何龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface View : UIView
@property(nonatomic , strong) UIImageView *imageview;
typedef void(^myblock)(View *vc);
@property(nonatomic , copy) myblock block;
@property(nonatomic , strong) UIImageView *nameimageview;
@property(nonatomic , strong) UIImageView *passimageview;
@property(nonatomic , strong) UITextField *nametextfiled;
@property(nonatomic , strong) UITextField *passtextfiled;
@property(nonatomic , strong) UIButton *loginbnt;

@end

NS_ASSUME_NONNULL_END
