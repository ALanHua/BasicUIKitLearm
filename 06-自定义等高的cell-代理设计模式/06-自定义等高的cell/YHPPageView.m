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
// 3,第三方框架


#import "YHPPageView.h"

@interface YHPPageView () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrolView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation YHPPageView


/**
 * 当控件通过xib\storyBoard创建时，会调用这个方法初始化控件
 */
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        NSLog(@"initWithCoder");
    }
    return self;
}

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

-(void)setUp{
   self.scrolView.backgroundColor = [UIColor redColor];
}

+(instancetype)pageView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

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
//    self.pageControl.hidden = (imageNames.count <= 1);
//    self.pageControl.hidesForSinglePage = YES;
}

/**
 *  当控件尺寸改变的时候
 */
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

#pragma mark 代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = (int)((scrollView.contentOffset.x / scrollView.frame.size.width)+0.5);
}


@end
