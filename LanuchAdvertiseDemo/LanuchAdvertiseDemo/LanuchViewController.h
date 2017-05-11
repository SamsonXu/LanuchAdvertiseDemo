//
//  LanuchViewController.h
//  LaunchDemo
//
//  Created by iOS－Dev on 2017/5/10.
//  Copyright © 2017年 iOS－Dev. All rights reserved.
//

#import "RootViewController.h"

@interface LanuchViewController : RootViewController
/**定时器
 */
@property (nonatomic, strong) NSTimer *timer;
/**倒计时
 */
@property (nonatomic, assign) NSInteger time;
/**网址
 */
@property (nonatomic, copy) NSString *url;
/**图片链接
 */
@property (nonatomic, copy) NSString *imgUrl;
@end
