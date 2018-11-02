//
//  HLDetailNewsViewController.m
//  党建e家
//
//  Created by 何龙 on 2018/10/26.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HLDetailNewsViewController.h"
#import <WebKit/WebKit.h>
@interface HLDetailNewsViewController ()<WKNavigationDelegate>

@end

@implementation HLDetailNewsViewController{
    WKWebView *_wkWebView;
    NSString *_titleStr;
    NSString *_contentStr;
    AFHTTPSessionManager *_manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone | UIRectEdgeBottom;
    _wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(8, 0, self.view.frame.size.width - 16, self.view.frame.size.height - 64)];
    _wkWebView.navigationDelegate = self;
    _wkWebView.backgroundColor = [UIColor clearColor];
    _wkWebView.scrollView.showsHorizontalScrollIndicator = NO;
    _wkWebView.scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_wkWebView];
    
    //得到str
    [self getStr];
    
    
    
}
#pragma mark - 得到str
-(void)getStr
{
    _manager = [[AFHTTPSessionManager alloc] init];
    NSDictionary *dic = @{@"newsId":_newsId,
                          @"user_id":@"0"};
    __weak typeof (self)weakself = self;
    [_manager POST:@"http://211.67.177.56:8080/hhdj/news/newsContent.do" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self->_titleStr = [[responseObject objectForKey:@"data"] objectForKey:@"title"];
        self->_contentStr = [[responseObject objectForKey:@"data"] objectForKey:@"content"];
        [weakself createWebView];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@", error);
    }];
}
#pragma mark - 加载webView
-(void)createWebView
{
    CGFloat width = [[UIScreen mainScreen] bounds].size.width - 30;
    CGFloat fontSize = 18;
    NSMutableString *contentStr = [NSMutableString stringWithFormat:@"<html>\
                                   <head>\
                                   <title></title>\
                                   <meta name=\"viewport\" content=\"width=device-width, minimum-scale=1.0, initial-scale=1.0, maximum-scale=1.0, user-scalable=1\" />\
                                   </head>\
                                   <style>\
                                   img {\
                                   display:table-cell;\
                                   text-align:center;\
                                   vertical-align:middle;\
                                   max-width:%fpx;\
                                   width:expression(this.width<%fpx?\"auto\":\"%fpx\");\
                                   max-height:auto;\
                                   margin:auto;\
                                   }</style>\
                                   <body width=\"%fpx\" style=\"\"><h3>%@</h3><div class=\"header\" style=\"word-break : break-all;overflow:hidden;width: %fpx;font-size:%fpx\">%@</div></body></html>", width, width, width, width, _titleStr, width, fontSize, _contentStr];
    
    [contentStr replaceOccurrencesOfString:@"<img" withString:@"<img onclick =\"imgClicked(this)\"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [contentStr length] - 1)];
    
    [_wkWebView loadHTMLString:contentStr baseURL:nil];
}



- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
    [webView evaluateJavaScript:@"function imgClicked(element) {\
     document.location = element.src;\
     }" completionHandler:^(id par, NSError *error) {
         // Block中处理是否通过了或者执行JS错误的代码
         ;
     }];
    
    //    [webView stringByEvaluatingJavaScriptFromString: @"function imgClicked(element) {\
    //     document.location = element.src;\
    //     }"];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    NSString *str = [navigationAction.request.mainDocumentURL pathExtension];
    if ([str isEqualToString:@"png"]||[str isEqualToString:@"jpg"] || [str isEqualToString:@"gif"])
    {
        NSLog(@"%@", [[navigationAction.request URL] absoluteString]);
        decisionHandler(WKNavigationActionPolicyCancel);
        return;
    }
    
    decisionHandler(WKNavigationActionPolicyAllow);
}


@end
