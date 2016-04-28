//
//  ViewController.m
//  03-综合使用
//
//  Created by yhp on 16/2/23.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/**文档注释*/
@property (weak, nonatomic) IBOutlet UIView *shopsView;
//文档注释
/**添加按钮*/
@property (weak, nonatomic) UIButton *addBtn;
/**删除按钮*/
@property (weak, nonatomic) UIButton *removeBtn;
/**全部商品*/
@property (strong, nonatomic) NSArray* shops;
@end

@implementation ViewController

#pragma mark - 添加按钮
-(UIButton*)addButtonWithImage:(NSString*)image highImage:(NSString*)highImage disableImage:(NSString*)disableImage
                    frame:(CGRect)frame action:(SEL)action
{
    UIButton* btn = [[UIButton alloc]init];
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageNamed:disableImage] forState:UIControlStateDisabled];
    btn.frame = frame;
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:btn];
    return btn;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    /**添加按钮*/
   self.addBtn = [self addButtonWithImage:@"add" highImage:@"add_highlighted" disableImage:@"add_disabled" frame:CGRectMake(30, 30, 50, 50) action:@selector(add:)];

    /**添加按钮*/
    self.removeBtn = [self addButtonWithImage:@"remove" highImage:@"remove_highlighted" disableImage:@"remove_disabled" frame:CGRectMake(270, 30, 50, 50) action:@selector(remove)];
    self.removeBtn.enabled = NO;
    //    数据
     self.shops = @[
                       @{
                           @"icon" : @"danjianbao",
                           @"name" : @"单肩包"
                           },
                       @{
                           @"icon" : @"liantiaobao",
                           @"name" : @"链条包"
                           },
                       @{
                           @"icon" : @"qianbao",
                           @"name" : @"钱包"
                           },
                       @{
                           @"name" : @"手提包",
                           @"icon" : @"shoutibao.png"
                           },
                       @{
                           @"name" : @"双肩包",
                           @"icon" : @"shuangjianbao.png"
                           },
                       @{
                           @"name" : @"斜挎包",
                           @"icon" : @"xiekuabao.png"
                           }
                       ];
}

#pragma mark 添加
-(void)add:(UIButton*)btn
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
  
//    获取index位置对应的商品数据
    NSDictionary* shop = self.shops[index];
////    添加图片
    UIImageView* iconView = [[UIImageView alloc]init];
    iconView.image = [UIImage imageNamed:shop[@"icon"]];
    iconView.frame = CGRectMake(0, 0, shopW, shopW);
    iconView.backgroundColor = [UIColor blueColor];
    [shopView addSubview:iconView];
////    添加文字
    UILabel* label = [[UILabel alloc]init];
    label.text = shop[@"name"];
    label.frame = CGRectMake(0, shopW, shopW, shopH -shopW);
    label.font = [UIFont systemFontOfSize:11];
    label.textAlignment = NSTextAlignmentCenter;
    [shopView addSubview:label];
//  控制按钮的可用性
    [self checkState];
}

#pragma mark 删除
-(void)remove
{
    [[self.shopsView.subviews lastObject] removeFromSuperview];
    [self checkState];
}

#pragma mark 检查状态 按钮状态
-(void)checkState
{
    
    self.removeBtn.enabled = (self.shopsView.subviews.count > 0);
//    if (self.shopsView.subviews.count == 0){
//        self.removeBtn.enabled = NO;
//    }else {
//        self.removeBtn.enabled = YES;
//    }
    self.addBtn.enabled = (self.shopsView.subviews.count < self.shops.count);
//    if (self.shopsView.subviews.count == self.shops.count) {
//        self.addBtn.enabled = NO;
//    }else{
//         self.addBtn.enabled = YES;
//    }
}
@end
