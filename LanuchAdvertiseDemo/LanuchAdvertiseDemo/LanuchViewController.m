//
//  LanuchViewController.m
//  LaunchDemo
//
//  Created by iOS－Dev on 2017/5/10.
//  Copyright © 2017年 iOS－Dev. All rights reserved.
//

#import "LanuchViewController.h"
#import "LanuchWebViewController.h"
#import "MainViewController.h"
#import "UIImageView+WebCache.h"
#import "MyControl.h"
#import "Define.h"
@interface LanuchViewController ()

/**广告视图
 */
@property (nonatomic, strong) UIImageView *backImageView;

/**跳过按钮
 */
@property (nonatomic, strong) UIButton *passBtn;

@end

@implementation LanuchViewController

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
}

- (void)createUI{
    
    _backImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    _backImageView.userInteractionEnabled = YES;
    _backImageView.backgroundColor = [UIColor grayColor];
    [_backImageView sd_setImageWithURL:[NSURL URLWithString:_imgUrl] placeholderImage:nil];
    [self.view addSubview:_backImageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jumpToWebView)];
    [_backImageView addGestureRecognizer:tap];
    
    _passBtn = [MyControl buttonWithFram:CGRectMake(KScreenWidth-80, 30, 60, 30) title:[NSString stringWithFormat:@"跳过%lds",_time] imageName:nil];
    _passBtn.backgroundColor = [UIColor whiteColor];
    [_passBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_passBtn addTarget:self action:@selector(jumpToRootViewCtrl) forControlEvents:UIControlEventTouchUpInside];
    _passBtn.layer.cornerRadius = 5;
    _passBtn.layer.masksToBounds = YES;
    [self.view addSubview:_passBtn];
    
    _timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timeCutdown) userInfo:nil repeats:YES];
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [loop addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)timeCutdown{
    
    if (self.time > 0) {
        
        [_passBtn setTitle:[NSString stringWithFormat:@"跳过%lds",self.time] forState:UIControlStateNormal];
        self.time--;
    }else{
        [_timer invalidate];
        [UIView animateWithDuration:1.5 animations:^{
            self.view.alpha = 0;
            
        } completion:^(BOOL finished) {
           
            [UIApplication sharedApplication].keyWindow.rootViewController = [[UINavigationController alloc]initWithRootViewController:[[MainViewController alloc]init]];
        }];
    }
    
}

- (void)jumpToWebView{
    
    [_timer invalidate];
    LanuchWebViewController *vc = [[LanuchWebViewController alloc]init];
    vc.url = self.url;
    
    MainViewController *main = [[MainViewController alloc]init];
    [UIApplication sharedApplication].keyWindow.rootViewController = [[UINavigationController alloc]initWithRootViewController:main];
    [main.navigationController pushViewController:vc animated:NO];
}

- (void)jumpToRootViewCtrl{
    
    [_timer invalidate];
    [UIView animateWithDuration:0.5 animations:^{
        self.view.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        [UIApplication sharedApplication].keyWindow.rootViewController = [[UINavigationController alloc]initWithRootViewController:[[MainViewController alloc]init]];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
