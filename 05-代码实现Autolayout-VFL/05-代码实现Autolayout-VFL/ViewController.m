//
//  ViewController.m
//  05-代码实现Autolayout-VFL
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
    
    
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    // 不要将AutoresizingMask转为Autolayout的约束
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    // 不要将AutoresizingMask转为Autolayout的约束
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    // 间距
    NSNumber *margin = @20;
    
    // 添加水平方向的约束
    NSString *vfl = @"H:|-margin-[blueView]-margin-[redView(==blueView)]-margin-|";
    NSDictionary *views = NSDictionaryOfVariableBindings(blueView, redView);
    NSDictionary *mertrics = NSDictionaryOfVariableBindings(margin);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:vfl options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:mertrics views:views];
    [self.view addConstraints:constraints];
    
    // 添加竖直方向的间距
    NSNumber *height = @40;
    NSString *vfl2 = @"V:[blueView(height)]-margin-|";
    NSDictionary *mertrics2 = NSDictionaryOfVariableBindings(margin, height);
    NSArray *constraints2 = [NSLayoutConstraint constraintsWithVisualFormat:vfl2 options:kNilOptions metrics:mertrics2 views:views];
    [self.view addConstraints:constraints2];
    
    // 添加红色剩余的约束
//    NSLayoutConstraint *redContraint1 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
//    NSLayoutConstraint *redContraint2 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
//    [self.view addConstraint:redContraint1];
//    [self.view addConstraint:redContraint2];

}

-(void)test02
{
    UIView* blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    //    间距
    NSNumber* margin = @20;
    //    添加水平方向上的约束
    NSString* vfl = @"H:|-margin-[blueView]-margin-|";
    //    NSDictionary* views = @{@"blueView":blueView};
    NSDictionary* views = NSDictionaryOfVariableBindings(blueView);//生成[blueView:blueView]这样的变量名
    NSDictionary* mertrics = NSDictionaryOfVariableBindings(margin);
    NSArray* constraints = [NSLayoutConstraint constraintsWithVisualFormat:vfl options:kNilOptions metrics:mertrics views:views];
    [self.view addConstraints:constraints];
    //    添加垂直方向上的约束
    NSNumber* height = @40;
    NSString* vfl2 = @"V:|-margin-[blueView(height)]";
    NSDictionary* mertrics2 = NSDictionaryOfVariableBindings(margin,height);
    NSArray* constraints2 = [NSLayoutConstraint constraintsWithVisualFormat:vfl2 options:kNilOptions metrics:mertrics2 views:views];
    [self.view addConstraints:constraints2];
}

-(void)test01
{
    [super viewDidLoad];
    UIView* blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    //    添加水平方向上的约束
    NSString* vfl = @"H:|-20-[blueView]-20-|";
    NSDictionary* views = @{@"blueView":blueView};
    NSArray* constraints = [NSLayoutConstraint constraintsWithVisualFormat:vfl options:kNilOptions metrics:nil views:views];
    [self.view addConstraints:constraints];
    //    添加垂直方向上的约束
    NSString* vfl2 = @"V:|-20-[blueView(40)]";
    NSDictionary* views2 = @{@"blueView":blueView};
    NSArray* constraints2 = [NSLayoutConstraint constraintsWithVisualFormat:vfl2 options:kNilOptions metrics:nil views:views2];
    [self.view addConstraints:constraints2];
}
@end
