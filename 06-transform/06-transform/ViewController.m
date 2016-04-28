//
//  ViewController.m
//  06-transform
//
//  Created by yhp on 16/3/20.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIView* tempView;
//@property(nonatomic,assign)CGFloat angle;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView* tempView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [tempView addSubview:[[UISwitch alloc] init]];
    tempView.backgroundColor = [UIColor redColor];
    tempView.transform = CGAffineTransformMakeRotation(M_PI_4);//累加
    tempView.transform = CGAffineTransformTranslate(tempView.transform,100,100);
    [self.view addSubview:tempView];
    self.tempView = tempView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    self.angle += M_PI_4;
    self.tempView.transform = CGAffineTransformIdentity;
//    [UIView animateWithDuration:1.0 animations:^{
//        self.tempView.transform = CGAffineTransformRotate(self.tempView.transform,M_PI_4);//累加
//    }];
    
    //  transform 形变属性，能完成的功能:平移，缩放，旋转
//    [UIView animateWithDuration:2.0 animations:^{
        //    缩放
//        self.tempView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        //    平移
//        self.tempView.transform = CGAffineTransformMakeTranslation(100, 100);
        //    旋转
//        self.tempView.transform = CGAffineTransformMakeRotation(M_PI_2);
//        CGAffineTransform translation = CGAffineTransformMakeTranslation(-100, 100);
//        CGAffineTransform scaleTranslation = CGAffineTransformScale(translation, 0.5, 0.5);
//        CGAffineTransform rutationScaleTranslation = CGAffineTransformRotate(scaleTranslation, M_PI_2);
//        self.tempView.transform = rutationScaleTranslation;
//    }];
    
}

@end
