//
//  ViewController.m
//  04-contentOffset的使用
//
//  Created by yhp on 16/2/28.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrolView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIImageView* imageView = [[UIImageView alloc]init];
//    imageView.image = [UIImage imageNamed:@"minion"];
//    imageView.frame = CGRectMake(0, 0, imageView.image.size.width, imageView.image.size.height);
   
    UIImageView* imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"minion"]];
    [self.scrolView addSubview:imageView];
//    设置内容大小
    self.scrolView.contentSize = imageView.image.size;
}

- (IBAction)left:(id)sender {
//    self.scrolView.contentOffset 偏移量
//    记录UIScrolView的滚动位置，滚到那
//    总结，内容的左上角与内容的差值
//    NSLog(@"%@",NSStringFromCGPoint(self.scrolView.contentOffset));
//   [UIView animateWithDuration:2 animations:^{
//      self.scrolView.contentOffset = CGPointMake(0, self.scrolView.contentOffset.y);
//   }];
    [UIView animateWithDuration:2 animations:^{
        self.scrolView.contentOffset = CGPointMake(0, self.scrolView.contentOffset.y);
    } completion:^(BOOL finished) {
        NSLog(@"completion");
    }];
}
- (IBAction)top:(id)sender {
//    self.scrolView.contentOffset = CGPointMake(self.scrolView.contentOffset.x,0);
    CGPoint offset = CGPointMake(self.scrolView.contentOffset.x,0);
    [self.scrolView setContentOffset:offset animated:YES];
}
- (IBAction)bottom:(id)sender {
    [UIView animateWithDuration:2 animations:^{
        CGFloat offset = self.scrolView.contentSize.height - self.scrolView.frame.size.height;
        self.scrolView.contentOffset = CGPointMake(self.scrolView.contentOffset.x,offset);
    }];

//    OC语法细节，不能修改OC对象的结构体属性成员
}

- (IBAction)right:(id)sender {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    [UIView setAnimationDelegate:self];//代理
    [UIView setAnimationDidStopSelector:@selector(stop)];
    [UIView setAnimationWillStartSelector:@selector(start)];
    
    CGFloat offset = self.scrolView.contentSize.width - self.scrolView.frame.size.width;
    self.scrolView.contentOffset = CGPointMake(offset, self.scrolView.contentOffset.y);

    [UIView commitAnimations];
}

-(void)start
{
    NSLog(@"start");
}

-(void)stop
{
    NSLog(@"stop");
}

@end
