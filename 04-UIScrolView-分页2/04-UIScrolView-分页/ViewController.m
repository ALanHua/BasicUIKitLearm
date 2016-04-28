//
//  ViewController.m
//  04-UIScrolView-分页
//
//  Created by yhp on 16/2/29.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPPageView.h"
@interface ViewController ()

/** pageView */
@property(nonatomic,strong)YHPPageView* pageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    YHPPageView* pageView = [YHPPageView pageView];
    YHPPageView* pageView = [[YHPPageView alloc]init];
    
    pageView.frame = CGRectMake(37, 50, 250, 200);
    pageView.imageNames = @[@"img_00",@"img_01",@"img_02",@"img_03"];
    pageView.otherColor = [UIColor grayColor];
    pageView.currentColor = [UIColor orangeColor];
    [self.view addSubview:pageView];
    self.pageView = pageView;
    
}
//消息循环运行循环
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.pageView.frame = CGRectMake(37, 50, 300, 130);
}
@end
