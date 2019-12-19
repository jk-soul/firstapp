//
//  NewsWebViewViewController.m
//  firstapp
//
//  Created by ipad on 2019/12/13.
//  Copyright © 2019 ipad. All rights reserved.
//

#import "NewsWebViewViewController.h"
#import <WebKit/WebKit.h>

@interface NewsWebViewViewController ()<WKNavigationDelegate>

@property(nonatomic,strong,readwrite) WKWebView *webview;
@property(nonatomic,strong,readwrite) UIProgressView *progressView;

@end

@implementation NewsWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    [self.view addSubview:({
        self.webview = [[WKWebView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88)];
        self.webview.navigationDelegate = self;
        self.webview;
    })] ;

    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    
    
    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 88, self.view.bounds.size.width, 2)];
        self.progressView;
    })];
    
    [self.webview addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    NSLog(@"before");
    decisionHandler(WKNavigationActionPolicyAllow);
};

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"finish");
};

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progressView.progress = self.webview.estimatedProgress;
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)dealloc
{
    [self.webview removeObserver:self forKeyPath:@"estimatedProgress"];
}
@end
