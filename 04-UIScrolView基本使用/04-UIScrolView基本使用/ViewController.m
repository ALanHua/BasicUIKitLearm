//
//  ViewController.m
//  04-UIScrolView基本使用
//
//  Created by yhp on 16/2/28.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrolView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    如果想静止某个方向的滚动，那么可以直接设置width或者height=0
    self.scrolView.contentSize = CGSizeMake(0, 250);
    
    self.scrolView.scrollEnabled = NO;
}

@end
