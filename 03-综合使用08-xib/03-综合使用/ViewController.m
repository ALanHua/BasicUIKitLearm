//
//  ViewController.m
//  03-综合使用
//
//  Created by yhp on 16/2/23.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPShop.h"
#import "YHPShopView.h"

@interface ViewController ()
/**文档注释*/
@property (weak, nonatomic) IBOutlet UIView *shopsView;
/**指示器*/
@property (weak, nonatomic) IBOutlet UILabel *hud;

//文档注释
/**添加按钮*/
@property (weak, nonatomic) UIButton *addBtn;
/**删除按钮*/
@property (weak, nonatomic) UIButton *removeBtn;
/**全部商品*/
@property (strong, nonatomic) NSArray* shops;
@end

@implementation ViewController
/**重写get方法实现懒加载*/
-(NSArray* )shops
{
    if (_shops == nil)
    {
        //        加载字典数组
        NSArray* dictArray = [NSArray arrayWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"shops" ofType:@"plist"]];
        
        NSMutableArray* shopArray = [NSMutableArray array];
        for (NSDictionary* dict in dictArray) {
            YHPShop* shop = [YHPShop shopWithDict:dict];
            [shopArray addObject:shop];
        }
        _shops = shopArray;
    }
    return _shops;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    //    裁剪
    self.shopsView.clipsToBounds = YES;
    //  加载xib,xib-编译-nib
    //    方法1
    //    NSArray* objs = [[NSBundle mainBundle]loadNibNamed:@"Test" owner:nil options:nil];
    //    [self.view addSubview:objs[0]];
//    方法2
//    一个UINIb对象代表一个xib对象
//    UINib* nib = [UINib nibWithNibName:@"Test" bundle:[NSBundle mainBundle]];
//    UINib* nib = [UINib nibWithNibName:@"Test" bundle:nil];//默认是mainBundle
////    NSArray* objs = [nib instantiateWithOwner:nil options:nil];
//    [self.view addSubview:[objs lastObject]];
    /**添加按钮*/
    self.addBtn = [self addButtonWithImage:@"add" highImage:@"add_highlighted" disableImage:@"add_disabled" frame:CGRectMake(30, 30, 50, 50) action:@selector(add)];
    
    /**添加按钮*/
    self.removeBtn = [self addButtonWithImage:@"remove" highImage:@"remove_highlighted" disableImage:@"remove_disabled" frame:CGRectMake(270, 30, 50, 50) action:@selector(remove)];
    self.removeBtn.enabled = NO;
    //   加载plist数据(比较大)
}

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

#pragma mark 添加
-(void)add
{
    //    每一个商品的尺寸
    CGFloat shopW = 70;
    CGFloat shopH = 90;
    //    一行的列数
    int cols = 3;
    //    每一行之间的间距
    CGFloat colMargin = (self.shopsView.frame.size.width - cols * shopW) / (cols-1);
    CGFloat rowMargin = (self.shopsView.frame.size.height - cols * shopH) / (cols-1);
    
    //    商品的索引
    NSInteger index = self.shopsView.subviews.count;
    //创建一个父控件，存放图片和文字
    YHPShopView* shopView = [YHPShopView shopViewWithShop:self.shops[index]];
    //  取出商品模型
//    YHPShop* shop = self.shops[index];
//    shopView.shop = shop;//将数据模型传递过去
    //    商品的x值
    NSInteger col = index % cols;
    CGFloat shopX = col * (shopW + colMargin);
    //    商品的y值
    NSInteger row = index / cols;
    CGFloat shopY = row * (shopH + rowMargin);
    shopView.frame = CGRectMake(shopX, shopY, shopW, shopH);
    
    [self.shopsView addSubview:shopView];
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
    self.addBtn.enabled = (self.shopsView.subviews.count < self.shops.count);
//    显示HD
    NSString* text = nil;
    if(self.removeBtn.enabled == NO) {//删光了
        text = @"已经全部删除";
    }else if (self.addBtn.enabled == NO) {//加满了
        text = @"已经添加满了";
    }
    
    if (text == nil) return;
    
    self.hud.text = text;
    self.hud.alpha = 1.0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.hud.alpha = 0.0;
    });// GCD 多线程
}
@end
