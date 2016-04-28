//
//  ViewController.m
//  04-contentOffInset的使用
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
    UIImageView* imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"minion"]];
    [self.scrolView addSubview:imageView];
//    设置内容大小
    self.scrolView.contentSize = imageView.image.size;

//    设置contentInset
    self.scrolView.contentInset = UIEdgeInsetsMake(80, 40, 20, 20);
}

- (IBAction)left:(id)sender {
    self.scrolView.contentOffset = CGPointMake(0, self.scrolView.contentOffset.y);
}
- (IBAction)top:(id)sender {
    CGPoint offset = CGPointMake(self.scrolView.contentOffset.x,0);
    [self.scrolView setContentOffset:offset animated:YES];
}
- (IBAction)bottom:(id)sender {
    CGFloat offset = self.scrolView.contentSize.height - self.scrolView.frame.size.height;
    self.scrolView.contentOffset = CGPointMake(self.scrolView.contentOffset.x,offset);
//    OC语法细节，不能修改OC对象的结构体属性成员
}

- (IBAction)right:(id)sender {
    CGFloat offset = self.scrolView.contentSize.width - self.scrolView.frame.size.width;
    self.scrolView.contentOffset = CGPointMake(offset, self.scrolView.contentOffset.y);

}


@end
