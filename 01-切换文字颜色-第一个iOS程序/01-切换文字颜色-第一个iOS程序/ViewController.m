//
//  ViewController.m
//  01-切换文字颜色-第一个iOS程序
//
//  Created by yhp on 16/2/21.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

//分类，@interface ViewController(HighClass)
//     @end
//存放一个类的私有属性
#pragma mark 类扩展:可以扩展属性和方法声明
@interface ViewController ()
@property(nonatomic,weak)IBOutlet UILabel* label;
@end


@implementation ViewController

#pragma mark 监听红色按钮点击
-(IBAction)redClick
{
//    拿到文本标签对象
    self.label.textColor = [UIColor redColor];
    self.label.text = @"我是红色文字";
    self.label.font = [UIFont systemFontOfSize:20];
//    NSLog(@"redClick");
}

#pragma mark 监听绿色按钮点击
-(IBAction)greenClick
{
    self.label.textColor = [UIColor greenColor];
    self.label.text = @"我是绿色文字";
    self.label.font = [UIFont systemFontOfSize:30];
//    NSLog(@"greenClick");
}

#pragma mark 监听蓝色按钮点击
-(IBAction)blueClick
{
    self.label.textColor = [UIColor blueColor];
    self.label.text = @"我是蓝色文字";
    self.label.font = [UIFont systemFontOfSize:40];
//    NSLog(@"blueClick");
}
@end
