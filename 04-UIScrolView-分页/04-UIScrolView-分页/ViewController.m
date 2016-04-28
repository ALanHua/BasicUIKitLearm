//
//  ViewController.m
//  04-UIScrolView-分页
//
//  Created by yhp on 16/2/29.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrolView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int count = 5;
    CGFloat w = self.scrolView.frame.size.width;
    CGFloat h = self.scrolView.frame.size.height;
    
    for (int i = 0; i < count; i++) {
        UIImageView* imageView = [[UIImageView alloc]init];
        NSString* name = [NSString stringWithFormat: @"img_0%i",i];
        imageView.image = [UIImage imageNamed:name];
//        frame
        imageView.frame = CGRectMake(i * w, 0, w, h);
        [self.scrolView addSubview:imageView];
   }
//    设置内容大小
    CGFloat contentW = count * w;
    self.scrolView.contentSize = CGSizeMake(contentW, 0);
    self.scrolView.showsHorizontalScrollIndicator = NO;
//一页一页切换
    self.scrolView.pagingEnabled = YES;
//    总页数
    self.pageControl.numberOfPages = count;
}

#pragma mark - <UIScrolViewDelegate>
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    page四舍五入
    int page = (int)(scrollView.contentOffset.x / scrollView.frame.size.width + 0.5);
    self.pageControl.currentPage = page;
}

@end
