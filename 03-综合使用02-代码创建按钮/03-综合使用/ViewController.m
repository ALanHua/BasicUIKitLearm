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
                    frame:(CGRect)frame tag:(NSInteger)tag action:(SEL)action
{
    UIButton* Btn = [[UIButton alloc]init];
    [Btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [Btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [Btn setBackgroundImage:[UIImage imageNamed:disableImage] forState:UIControlStateDisabled];
    Btn.frame = frame;
    [Btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    Btn.tag = tag;
    [self.view addSubview:Btn];
    
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addButtonWithImage:@"add" highImage:@"add_highlighted" disableImage:@"add_disabled" frame:CGRectMake(30, 30, 50, 50) tag:10 action:@selector(add)];
    
    [self addButtonWithImage:@"remove" highImage:@"remove_highlighted" disableImage:@"remove_disabled" frame:CGRectMake(270, 30, 50, 50) tag:20 action:@selector(remove)];
    
}

-(void)add{
    UIImageView* iconView = [[UIImageView alloc]init];
    iconView.image = [UIImage imageNamed:@"danjianbao"];
    iconView.frame = CGRectMake(0, 0, 50, 50);
    [self.shopsView addSubview:iconView];
    
    UILabel* label = [[UILabel alloc]init];
    label.text =@"单肩包";
    label.frame = CGRectMake(0, 50, 50, 20);
//    label.backgroundColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:11];
    label.textAlignment = NSTextAlignmentCenter;
    
    [self.shopsView addSubview:label];
}
-(void)remove
{
    NSLog(@"删除....");
}
-(void)click:(UIButton*)sender
{
    if (sender.tag == 10) {
        NSLog(@"添加");
    }else{
        NSLog(@"删除");
    }
}
@end
