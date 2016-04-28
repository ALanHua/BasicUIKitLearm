//
//  YHPTextViewController.m
//  06-聊天布局
//
//  Created by yhp on 16/3/17.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPTextViewController.h"

@implementation YHPTextViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(receiveNotification:) name:@"aaa" object:nil];
}

-(void)receiveNotification:(NSNotification*) note
{
    
}

@end
