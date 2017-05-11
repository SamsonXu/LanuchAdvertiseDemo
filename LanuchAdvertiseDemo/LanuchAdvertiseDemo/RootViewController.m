//
//  RootViewController.m
//  wentoubao
//
//  Created by iOS－Dev on 2017/4/11.
//  Copyright © 2017年 joinbank. All rights reserved.
//

#import "RootViewController.h"
#import "MyControl.h"
#import "Define.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)createUI{
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeight-64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [MyControl setExtraCellLineHidden:_tableView];
    [self.view addSubview:_tableView];
}

- (void)hasleftBarButtonItemWithImage:(NSString *)imgName title:(NSString *)title{
    
    UIButton *btn = [MyControl buttonWithFram:CGRectMake(0, 0, 30, 30) title:title imageName:imgName];
    [btn addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    [self.navigationItem setLeftBarButtonItem:leftItem];
}

- (void)hasRightBarButtonItemWithImage:(NSString *)imgName title:(NSString *)title{
    
    UIButton *btn = [MyControl buttonWithFram:CGRectMake(0, 0, 30, 30) title:title imageName:imgName];
    [btn addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    [self.navigationItem setRightBarButtonItem:rightItem];
}

- (void)leftClick:(UIButton *)sender{
    
    sender.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
    sender.enabled = YES;
}

- (void)rightClick:(UIButton *)sender{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
