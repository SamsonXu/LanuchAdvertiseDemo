//
//  RootViewController.h
//  wentoubao
//
//  Created by iOS－Dev on 2017/4/11.
//  Copyright © 2017年 joinbank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}

- (void)createUI;

- (void)hasleftBarButtonItemWithImage:(NSString *)imgName title:(NSString *)title;

- (void)hasRightBarButtonItemWithImage:(NSString *)imgName title:(NSString *)title;

- (void)leftClick:(UIButton *)sender;

- (void)rightClick:(UIButton *)sender;

@end
