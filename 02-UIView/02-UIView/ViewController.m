//
//  ViewController.m
//  02-UIView
//
//  Created by yhp on 16/2/22.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//控制器view加载完加载
- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"%@",self.view.subviews);
//    self.view.frame.origin.x;
//    self.view.frame.origin.y;
//    self.view.frame.size.height;
//    self.view.frame.size.width;
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
//    self.view.frame.size;
//    self.view.bounds.size;
}

- (IBAction)btnClick {
    UIView* tempView = [[UIView alloc]init];
    tempView.backgroundColor = [UIColor orangeColor];
    tempView.frame = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:tempView];
    
//    UISwitch* s = [[UISwitch alloc]init];
//    UIStepper* stepper = [[UIStepper alloc]init];
//    [self.view addSubview:stepper];
//    [self.view addSubview:s];
//    
//    UISlider* slider = [[UISlider alloc]init];
////    [self.view insertSubview:slider aboveSubview:s];
//    [self.view insertSubview:slider belowSubview:s];
//    UISwitch* s = [[UISwitch alloc]init];
//    [self.view addSubview:s];
//    
//    UIStepper* stepper = [[UIStepper alloc]init];
//    [self.view addSubview:stepper];
//    
//    NSLog(@"%@",self.view.subviews);
//    [[self.view viewWithTag:99] removeFromSuperview];
    
}


@end
