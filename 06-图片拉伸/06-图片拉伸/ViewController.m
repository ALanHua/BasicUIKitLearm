//
//  ViewController.m
//  06-图片拉伸
//
//  Created by yhp on 16/3/16.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Extension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView* imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(10, 10, 280, 150);
    imageView.image = [UIImage imageNamed:@"chat_send_nor"];;
//    imageView.image = [UIImage resizableImage:@"chat_send_nor"];
    [self.view addSubview:imageView];
    //    加载图片
//    UIImage* image = [UIImage imageNamed:@"chat_send_nor"];
//    //    拉伸处理
////    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(30, 30, 30, 30)resizingMode:UIImageResizingModeStretch];
//    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
//    
//    imageView.image = image;
}


@end
