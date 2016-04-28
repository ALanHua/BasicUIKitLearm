//
//  ViewController.m
//  06-通知，KVO，代理
//
//  Created by yhp on 16/3/24.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPPerson.h"
@interface ViewController ()

/** person对象 */
@property(nonatomic,strong)YHPPerson* p1;
@property(nonatomic,strong)YHPPerson* p2;
@property(nonatomic,strong)YHPPerson* p3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.p1 = [[YHPPerson alloc]init];
//    self.p1.name = @"p1";
//    self.p2 = [[YHPPerson alloc]init];
//    self.p2.name = @"p2";
//    self.p3 = [[YHPPerson alloc]init];
//    self.p3.name = @"p3";
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self.p1 selector:@selector(test) name:@"TestNotification" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self.p2 selector:@selector(test) name:@"TestNotification" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self.p3 selector:@selector(test) name:@"TestNotification" object:nil];
//    
////    发送通知
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"TestNotification" object:nil];
//    KVC :key value coding 常见作用，给模型属性赋值
//    KVO :key value observing 常见作用，监听对象属性的改变
    
    self.p1 = [[YHPPerson alloc]init];
    self.p1.name = @"p1";
    [self.p1 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    self.p1.name = @"pp122";
}

-(void)dealloc
{
    [self.p1 removeObserver:self forKeyPath:@"name"];
}
#pragma mark - KVO监听方法
/*
 * 当监听到OBject的keyPath属性发送了改变
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"%@,%@,%@",object,keyPath,change);
}

@end
