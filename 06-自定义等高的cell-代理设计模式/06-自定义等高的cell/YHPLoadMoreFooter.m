//
//  YHPLoadMoreFooter.m
//  06-自定义等高的cell
//
//  Created by yhp on 16/3/22.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPLoadMoreFooter.h"

@interface YHPLoadMoreFooter ()
@property (weak, nonatomic) IBOutlet UIButton *loadMoreButton;
@property (weak, nonatomic) IBOutlet UIView *loadingMoreView;

@end



@implementation YHPLoadMoreFooter
+(instancetype)footer
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}
/**
 *  点击了加载更多的按钮
 */
- (IBAction)loadMore {
    self.loadMoreButton.hidden= YES;
    self.loadingMoreView.hidden = NO;
    
    //  告诉代理
    if ([self.delegate respondsToSelector:@selector(loadMoreFooterDidClickLoadMoreButton:)]) {//判断代理是否实现了代理的方法
        [self.delegate loadMoreFooterDidClickLoadMoreButton:self];
    }

}

-(void)endLoading
{
    self.loadMoreButton.hidden= NO;
    self.loadingMoreView.hidden = YES;
}

@end
