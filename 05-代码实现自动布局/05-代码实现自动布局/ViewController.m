//
//  ViewController.m
//  05-代码实现自动布局
//
//  Created by yhp on 16/3/6.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView* blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    //    不要讲AutoresizingMask转为Autolayouy的约束
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    UIView* redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    //    不要讲AutoresizingMask转为Autolayouy的约束
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    /*********** 蓝色控件约束************/
    //    高度约束:40
    NSLayoutConstraint* heightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:40];
    [blueView addConstraint:heightConstraint];
    //  添加左边约束blueView的右边距离父控件右边有10的间距
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20];
    [self.view addConstraint:leftConstraint];
    //  添加右边约束blueView的右边距离父控件右边有10的间距
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20];
    [self.view addConstraint:rightConstraint];
    //  添加顶部约束距离父控件10的间距
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    [self.view addConstraint:topConstraint];
    /*********** 红色控件约束************/
    //  添加高度约束，与蓝色等高
    NSLayoutConstraint* heightConstraint2 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    [self.view addConstraint:heightConstraint2];
    //  添加左边约束，等于父控件的中心点的X
    NSLayoutConstraint *leftConstraint2 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self.view addConstraint:leftConstraint2];
    //  添加顶部约束，redView的顶部距离blueView的底部有20的距离
    NSLayoutConstraint *topConstraint2 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20];
    [self.view addConstraint:topConstraint2];
    //  添加右边约束，redView的右边等于blueView的右边
    NSLayoutConstraint *rightConstraint2 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    [self.view addConstraint:rightConstraint2];
}
/**
 * 宽度高度设置约束为父控件的一半，且水平居中
 */
-(void)test02
{
    UIView* blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    //    不要讲AutoresizingMask转为Autolayouy的约束
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    //    宽度约束:父控件的一半
    NSLayoutConstraint* widthConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    [self.view addConstraint:widthConstraint];
    //    高度约束:父控件的一半
    NSLayoutConstraint* heightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    [self.view addConstraint:heightConstraint];
    //    水平居中
    NSLayoutConstraint* xConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self.view addConstraint:xConstraint];
    //    水平居中
    NSLayoutConstraint* yConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self.view addConstraint:yConstraint];
}
/**
 *  宽度高度设置约束为100，距离父控件的右下角10的高度
 */
-(void)test01
{
    UIView* blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    //    不要讲AutoresizingMask转为Autolayouy的约束
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    //    宽度约束:300
    NSLayoutConstraint* widthConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:100];
    [blueView addConstraint:widthConstraint];
    //    高度约束:100
    NSLayoutConstraint* heightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:100];
    [blueView addConstraint:heightConstraint];
    //  添加右边约束blueView的右边距离父控件右边有10的间距
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10];
    //    [blueView addConstraint:rightConstraint];//erro
    //    约束要添加到大的控件上
    [self.view addConstraint:rightConstraint];
    
    //  添加底部约束距离父控件10的间距
    NSLayoutConstraint *bottonConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-10];
    [self.view addConstraint:bottonConstraint];
}

@end
