//
//  YHPPageView.m
//  04-UIScrolView-分页
//
//  Created by yhp on 16/2/29.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

//  框架
// 1,苹果的框架 UIKit
// 2,自定义的框架
// 3,  第三方框架


#import "YHPPageView.h"

@interface YHPPageView () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrolView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
/** 定时 */
@property(nonatomic,strong)NSTimer* timer;
@end

@implementation YHPPageView

#pragma mark - 初始化方法
+(instancetype)pageView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}
/*
 * 代码创建会调用这个方法
 */
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}
/**
 *  当控件从xib或storyboard中创建完毕后，就会调用该方法
 */
- (void)awakeFromNib
{
    [self setUp];
}

/**
 *  初始化代码
 */
-(void)setUp
{
    self.scrolView.backgroundColor = [UIColor redColor];
    // 创建定时器
    [self startTimer];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    //    设置scrolView的frame
    self.scrolView.frame = self.bounds;
    //    TDD 设置imageView的frame
    CGFloat scrolW = self.scrolView.frame.size.width;
    CGFloat scrolH = self.scrolView.frame.size.height;
    
    CGFloat pageW = 100;
    CGFloat pageH = 20;
    CGFloat pageX = scrolW - pageW;
    CGFloat pageY = scrolH - pageH;
    self.pageControl.frame = CGRectMake(pageX, pageY, pageW, pageH);
    
    //    设置内容大小
    self.scrolView.contentSize = CGSizeMake(self.imageNames.count * scrolW,0);
    
    for (int i = 0; i < self.scrolView.subviews.count; i++) {
        UIImageView* imageView = self.scrolView.subviews[i];
        imageView.frame = CGRectMake(i * scrolW, 0, scrolW, scrolH);
    }
}
#pragma mark - 设置属性
-(void)setImageNames:(NSArray *)imageNames
{
    _imageNames = imageNames;
    
//    移除之前的所有imageView
    [self.scrolView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];//让数组中的元素都执行@selector中的方法
    
    for (int i = 0; i < imageNames .count; i++) {
        UIImageView* imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:imageNames[i]];
        [self.scrolView addSubview:imageView];
    }
//    设置页数
    self.pageControl.numberOfPages = imageNames.count;
}

- (void)setOtherColor:(UIColor *)otherColor
{
    _otherColor = otherColor;
    self.pageControl.pageIndicatorTintColor = otherColor;
}

-(void)setCurrentColor:(UIColor *)currentColor
{
    _currentColor = currentColor;
    self.pageControl.currentPageIndicatorTintColor = currentColor;
}

#pragma mark - 代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = (int)((scrollView.contentOffset.x / scrollView.frame.size.width)+0.5);
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}
#pragma mark - 定时器控制
-(void)startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)stopTimer
{
    [self.timer invalidate];
//    self.timer = nil;
}

/**
 *  下一页
 */
-(void)nextPage
{
    NSInteger page = self.pageControl.currentPage + 1;
    if (page == self.pageControl.numberOfPages) {
        page = 0;
    }
    CGPoint offset = self.scrolView.contentOffset;
    offset.x =  page * self.scrolView.frame.size.width;
    [self.scrolView setContentOffset:offset animated:YES];
}
@end
