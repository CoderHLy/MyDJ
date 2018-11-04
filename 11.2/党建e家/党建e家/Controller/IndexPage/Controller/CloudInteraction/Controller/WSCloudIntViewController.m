//
//  CloudIntViewController.m
//  党建e家
//
//  Created by Sunweisheng on 2018/11/1.
//  Copyright © 2018年 何龙. All rights reserved.
//

#import "WSCloudIntViewController.h"
#import "WSClodeIntTableViewCell.h"
#import "WSRuleViewModel.h"
#import "CloudeDatSouProtocol.h"
#import "AssignToObject.h"
#import "CloudeModel.h"
#import "AddContentView.h"
#import "WSCommentViewController.h"

#define CLOUDEURL @"http://211.67.177.56:8080/hhdj/forum/forumList.do"

@interface WSCloudIntViewController ()<UITableViewDelegate>
{
    CGFloat lastContentOffSet;
}
@property (nonatomic,strong) UITableView *cloTableView;

@property (nonatomic,strong) CloudeDatSouProtocol *cloudeDatSouProtocol;

@property (nonatomic,strong) AddContentView *addContentView;

@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation WSCloudIntViewController

//懒加载tableView
-(UITableView *)cloTableView
{
    if (!_cloTableView)
    {
        _cloTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT - 80) style:UITableViewStylePlain];
        [_cloTableView registerClass:[WSClodeIntTableViewCell class] forCellReuseIdentifier:@"WSClodeIntTableViewCell"];
        
        _cloudeDatSouProtocol = [[CloudeDatSouProtocol alloc] init];
        
        _cloTableView.delegate = self;
        _cloTableView.dataSource = _cloudeDatSouProtocol;
    }
    return _cloTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置白色背景
    self.view.backgroundColor = [UIColor whiteColor];
    
    //获取网络数据
    [self gainWebData];
    
    //加载tableView
    [self.view addSubview:self.cloTableView];
    
    //加载➕视图
    [self initAddView];
}
//获取接口数据
-(void)gainWebData
{
    WSRuleViewModel *viewModel = [[WSRuleViewModel alloc] init];
    NSDictionary *dic = [NSDictionary dictionary];
    __weak typeof(self) weakSelf = self;
    [viewModel postWebData:^(NSMutableArray * _Nonnull arr) {
        weakSelf.cloudeDatSouProtocol.cloudeDatSourceArr = [AssignToObject customModel:@"CloudeModel" ToArray:arr];
        [self.cloTableView reloadData];
    } andUrlStr:CLOUDEURL andDic:dic];
}

//加号按钮
-(void)initAddView
{
    _imageView = [UIImageView imageName:@"add_interaction" superView:self.view touch:YES];
    _imageView.backgroundColor = [UIColor clearColor];
    [_imageView setAlpha:0.9];
    [_imageView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(-50);
        make.right.equalTo(-20);
        make.width.height.equalTo(60);
    }];
    
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addContetView)];
    [_imageView addGestureRecognizer:tap];
}
//添加内容
-(void)addContetView
{
    _addContentView = [[AddContentView alloc] init];
    [_addContentView setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.5]];
    [self.view addSubview:_addContentView];
    [_addContentView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(0);
        make.right.equalTo(0);
        make.size.equalTo(CGSizeMake(SCREENWIDTH, SCREENHEIGHT));
    }];
}

#pragma mark -------------------UITableViewDelegate--------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
#pragma mark -------------------UIScrollViewDelegate--------------------
- (void)scrollViewWillBeginDragging:(UITableView *)scrollView
{
    //全局变量记录滑动前的contentOffSet
    lastContentOffSet = scrollView.contentOffset.y;
}
- (void)scrollViewDidScroll:(UITableView *)scrollView
{
    if (scrollView.contentOffset.y > lastContentOffSet)
    {
//        NSLog(@"上滑");
        _imageView.hidden = YES;
    }
    else if (scrollView.contentOffset.y < lastContentOffSet)
    {
//        NSLog(@"下滑");
        _imageView.hidden = NO;
    }
}
//点击空白处隐藏评论视图
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.addContentView.hidden = YES;
}
@end
