//
//  HLTakePhotoViewController.m
//  党建e家
//
//  Created by 何龙 on 2018/10/26.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HLTakePhotoViewController.h"
#import "HLTakePhotoCollectionViewCell.h"
#import "HLNewsViewModel.h"
#import "HLDetailNewsViewController.h"
@interface HLTakePhotoViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end
#define cellId @"fad"
@implementation HLTakePhotoViewController{
    UICollectionView *_collectionView;
    NSMutableArray *_objArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"urltype = %@", _urlType);
    self.edgesForExtendedLayout = UIRectEdgeNone | UIRectEdgeBottom;
    [self initCollectionView];
}

-(void)initCollectionView
{
    //初始化layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置滚动方向
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    //设置itemSize的大小
    layout.itemSize = CGSizeMake(SCREENWIDTH / 2, SCREENHEIGHT / 4 + 10);
    //初始化collectionView
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT - 64) collectionViewLayout:layout];
    //注册collectionViewCell
    [_collectionView registerClass:[HLTakePhotoCollectionViewCell class] forCellWithReuseIdentifier:cellId];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    
    [self initModel];
}
-(void)initModel
{
    HLNewsViewModel *obj = [[HLNewsViewModel alloc] init];
    [obj getObjArr:^(NSMutableArray * _Nonnull arr) {
        self->_objArr = arr;
        [self->_collectionView reloadData];
    } type:_urlType];
}
#pragma mark - collectionDelegateAndDataSource
//返回section个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个section的item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_objArr count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HLNewsModel *obj = [_objArr objectAtIndex:indexPath.row];
    HLTakePhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    [cell setModel:obj];
    return cell;
}

#pragma mark - 设置每个item的尺寸
//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

#pragma mark - 点击事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.selected = YES;
    
    HLNewsModel *obj = [_objArr objectAtIndex:indexPath.item];
    HLDetailNewsViewController *tempVC = [[HLDetailNewsViewController alloc] init];
    tempVC.title = @"随时随地拍";
    tempVC.newsId = obj.newsId;
    [self.navigationController pushViewController:tempVC animated:YES];
}
@end
