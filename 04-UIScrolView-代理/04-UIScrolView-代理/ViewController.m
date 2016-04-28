//
//  ViewController.m
//  04-UIScrolView-代理
//
//  Created by yhp on 16/2/29.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPDog.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrolView;
/** dog */
@property(nonatomic,strong)YHPDog* dog;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"minion"]];
    [self.scrolView addSubview:imageView];
    self.scrolView.backgroundColor = [UIColor redColor];
    self.scrolView.contentSize = imageView.image.size;
//    self.scrolView.delegate =self;
    self.dog = [[YHPDog alloc]init];
    self.scrolView.delegate = self.dog;
    
    UITextField* textField = [[UITextField alloc]init];
    textField.frame = CGRectMake(20, 300, 200, 20);
    textField.backgroundColor = [UIColor redColor];
    textField.delegate = self.dog;
//    [textField addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:textField];
}

//-(void)textChange:(UITextField*) textField
//{
//    NSLog(@"textChange");
//}
#pragma mark - <UIScrolViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"scrollViewDidScroll");
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
      NSLog(@"scrollViewWillBeginDragging");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
      NSLog(@"scrollViewDidEndDragging");
}
/**
 * (减速完毕）停止滚动的时候调用，由于惯性
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
      NSLog(@"scrollViewDidEndDecelerating");
}

@end
