//
//  ViewController.m
//  05-Autoresizing
//
//  Created by yhp on 16/3/2.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/** blueView */
@property(nonatomic,strong)UIView* blueView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView* blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.frame = CGRectMake(0, 0, 250, 250);
    
    blueView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin| UIViewAutoresizingFlexibleWidth;
    /**
     UIViewAutoresizingNone                 = 0,
     UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
     UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
     UIViewAutoresizingFlexibleTopMargin    = 1 << 3,//顶部不固定
     UIViewAutoresizingFlexibleBottomMargin = 1 << 5,
     UIViewAutoresizingFlexibleWidth        = 1 << 1,//宽度跟随父控件的宽度进行拉伸
     UIViewAutoresizingFlexibleHeight       = 1 << 4//宽度跟随父控件的高度进行拉伸
     */
    [self.view addSubview:blueView];
    self.blueView = blueView;
    
    UIView* redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    redView.frame = CGRectMake(150, 150, 100, 100);
    redView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
    [blueView addSubview:redView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGFloat w = 200 + arc4random_uniform(100);
    CGFloat h = 200 + arc4random_uniform(100);
    self.blueView.frame = CGRectMake(0, 0, w, h);
}

@end
