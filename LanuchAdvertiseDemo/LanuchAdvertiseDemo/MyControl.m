//
//  MyLabel.m
//  MyFamily
//
//  Created by qianfeng on 16/3/17.
//  Copyright (c) 2016年 Motion. All rights reserved.
//

#import "MyControl.h"

@implementation MyControl

+ (UILabel *)labelWithTitle:(NSString *)title color:(UIColor *)color fontOfSize:(NSInteger)fontOfSize numberOfLine:(NSInteger)num{
    return [self labelWithTitle:title fram:CGRectMake(0,0,0,0) color:color fontOfSize:fontOfSize numberOfLine:num];
    
}

+ (UILabel *)labelWithTitle:(NSString *)title fram:(CGRect)fram fontOfSize:(NSInteger)fontOfSize
{
    return [self labelWithTitle:title fram:fram fontOfSize:fontOfSize numberOfLine:1];
}

+ (UILabel *)labelWithTitle:(NSString *)title fram:(CGRect)fram  fontOfSize:(NSInteger)fontOfSize numberOfLine:(NSInteger)num
{
    return [self labelWithTitle:title fram:fram color:[UIColor blackColor] fontOfSize:fontOfSize numberOfLine:num];
}

+ (UILabel *)labelWithTitle:(NSString *)title fram:(CGRect)fram color:(UIColor *)color fontOfSize:(NSInteger)fontOfSize numberOfLine:(NSInteger)num
{
    UILabel *label = [[UILabel alloc]initWithFrame:fram];
    label.text = title;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:fontOfSize];
    label.numberOfLines = num;
    label.lineBreakMode = NSLineBreakByCharWrapping;
    return label;
}

+ (UILabel *)boldLabelWithTitle:(NSString *)title fram:(CGRect)fram color:(UIColor *)color fontOfSize:(NSInteger)fontOfSize{
    UILabel *label = [[UILabel alloc]initWithFrame:fram];
    label.text = title;
    label.textColor = color;
    label.font = [UIFont boldSystemFontOfSize:fontOfSize];
    label.numberOfLines = 1;
    return label;
}

+ (UIButton *)buttonWithFram:(CGRect)fram title:(NSString *)title imageName:(NSString *)imageName
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = fram;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    return btn;
}

+ (UIButton *)buttonWithFram:(CGRect)fram title:(NSString *)title imageName:(NSString *)imageName tag:(NSInteger)tag
{
    UIButton *btn = [self buttonWithFram:fram title:title imageName:imageName];
    btn.tag = tag;
    return btn;
}




@end
