//
//  LanuchWebViewController.m
//  LaunchDemo
//
//  Created by iOS－Dev on 2017/5/10.
//  Copyright © 2017年 iOS－Dev. All rights reserved.
//

#import "LanuchWebViewController.h"
#import <WebKit/WebKit.h>
#import "MainViewController.h"
#import "Define.h"
@interface LanuchWebViewController ()<WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;

@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation LanuchWebViewController

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}

- (void)createUI{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeight-64)];
    _webView.navigationDelegate = self;
    [self.view addSubview:_webView];
    [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    
    _progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 5)];
    _progressView.trackTintColor = [UIColor clearColor];
    _progressView.tintColor = [UIColor orangeColor];
    [_webView addSubview:_progressView];
    
    [self hasleftBarButtonItemWithImage:@"back2" title:nil];
}

- (void)leftClick:(UIButton *)sender{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    self.title = webView.title;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        
        if ([change[@"new"] floatValue] < [change[@"old"] floatValue]) {
            return;
        }
        
        [_progressView setProgress:[change[@"new"] floatValue] animated:YES];
        
        if (_progressView.progress == 1.0) {
            _progressView.hidden = YES;
            [_progressView removeFromSuperview];
        }
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [_webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
