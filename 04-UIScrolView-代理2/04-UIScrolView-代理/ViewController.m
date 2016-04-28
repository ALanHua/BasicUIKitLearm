//
//  ViewController.m
//  04-UIScrolView-代理
//
//  Created by yhp on 16/2/29.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrolView;
/** 图片 */
@property(nonatomic,weak)IBOutlet UIImageView* imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"minion"]];
    [self.scrolView addSubview:imageView];
    self.imageView = imageView;
    self.scrolView.backgroundColor = [UIColor redColor];
    self.scrolView.contentSize = imageView.image.size;
    // 设置代理
    self.scrolView.delegate = self;
    self.scrolView.minimumZoomScale = 2.0;
    self.scrolView.minimumZoomScale = 0.2;
}

#pragma mark - <UIScrolViewDelegate>
/**
 绝对缩放的内容,返回值必须是ScrolView的子控件
 */
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

@end
