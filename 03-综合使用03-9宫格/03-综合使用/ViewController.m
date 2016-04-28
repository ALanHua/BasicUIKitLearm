//
//  ViewController.m
//  03-综合使用
//
//  Created by yhp on 16/2/23.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *shopsView;

@end

@implementation ViewController

#pragma mark - 添加按钮
-(void)addButtonWithImage:(NSString*)image highImage:(NSString*)highImage disableImage:(NSString*)disableImage
                    frame:(CGRect)frame action:(SEL)action
{
    UIButton* Btn = [[UIButton alloc]init];
    [Btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [Btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [Btn setBackgroundImage:[UIImage imageNamed:disableImage] forState:UIControlStateDisabled];
    Btn.frame = frame;
    [Btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:Btn];
    
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addButtonWithImage:@"add" highImage:@"add_highlighted" disableImage:@"add_disabled" frame:CGRectMake(30, 30, 50, 50) action:@selector(add)];
    
    [self addButtonWithImage:@"remove" highImage:@"remove_highlighted" disableImage:@"remove_disabled" frame:CGRectMake(270, 30, 50, 50) action:@selector(remove)];
    
}

-(void)add
{
//    self.shopsView.clipsToBounds = YES;
//    每一个商品的尺寸
    CGFloat shopW = 70;
    CGFloat shopH = 90;
//    一行的列数
    int cols = 3;
//    每一行之间的间距
    CGFloat colMargin = (self.shopsView.frame.size.width - cols * shopW) / (cols-1);
    CGFloat rowMargin = (self.shopsView.frame.size.height - cols * shopH) / (cols-1);
//创建一个父控件，存放图片和文字
    UIView* shopView = [[UIView alloc]init];
    shopView.backgroundColor = [UIColor redColor];
//    商品的索引
    NSInteger index = self.shopsView.subviews.count;
//    商品的x值
    NSInteger col = index % cols;
    CGFloat shopX = col * (shopW + colMargin);
//    商品的y值
    NSInteger row = index / cols;
    CGFloat shopY = row * (shopH + rowMargin);
    shopView.frame = CGRectMake(shopX, shopY, shopW, shopH);
    [self.shopsView addSubview:shopView];
    
////    添加图片
    NSArray* images = @[@"danjianbao",@"liantiaobao",@"qianbao"];
    UIImageView* iconView = [[UIImageView alloc]init];
    iconView.image = [UIImage imageNamed:images[index]];
    iconView.frame = CGRectMake(0, 0, shopW, shopW);
    iconView.backgroundColor = [UIColor blueColor];
    [shopView addSubview:iconView];
////    添加文字
    UILabel* label = [[UILabel alloc]init];
    NSArray* tests = @[@"单肩包",@"链条包",@"钱包"];
    label.text = tests[index];
    label.frame = CGRectMake(0, shopW, shopW, shopH -shopW);
    label.font = [UIFont systemFontOfSize:11];
    label.textAlignment = NSTextAlignmentCenter;
    [shopView addSubview:label];
}
-(void)remove
{
    NSLog(@"删除....");
}

@end
