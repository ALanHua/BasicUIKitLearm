//
//  ViewController.m
//  04-scrollView的滚动条
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
    //    self.scrolView.showsHorizontalScrollIndicator = NO;
    //    self.scrolView.showsVerticalScrollIndicator = NO;
    
    for (int i = 0; i < 50; i++) {
        int row = i / 3;//行
        int col = i % 3;//列
        
        CGFloat x = col * (50 + 30);
        CGFloat y = row * (50 + 30);
        [self addGrid:x y:y];
    }
    
    UIView* lastView = [self.scrolView.subviews lastObject];
//    CGFloat content = lastView.frame.origin.y + lastView.frame.size.height;
    CGFloat content = CGRectGetMaxY(lastView.frame);
    self.scrolView.contentSize = CGSizeMake(0, content);

}

-(void)addGrid:(CGFloat)x y:(CGFloat)y
{
    UIView* grid =[[UIView alloc]init];
    grid.frame = CGRectMake(x, y, 50, 50);
    grid.backgroundColor = [UIColor blueColor];
    [self. scrolView addSubview:grid];
    
}
@end
