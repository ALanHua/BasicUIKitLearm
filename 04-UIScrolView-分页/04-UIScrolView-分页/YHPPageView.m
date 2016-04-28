//
//  YHPPageView.m
//  04-UIScrolView-分页
//
//  Created by yhp on 16/2/29.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPPageView.h"

@interface YHPPageView ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrolView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation YHPPageView

+(instancetype)pageView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)setImageName:(NSArray *)imageName
{
    _imageName = imageName;
    
    for (int i = 0; i < imageName .count; i++) {
        UIImageView* imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:imageName[i]];
        [self.scrolView addSubview:imageView];
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
//    TDD 设置imageView的frame
    
}

@end
