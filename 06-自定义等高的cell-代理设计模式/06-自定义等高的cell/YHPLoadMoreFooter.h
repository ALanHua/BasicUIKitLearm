//
//  YHPLoadMoreFooter.h
//  06-自定义等高的cell
//
//  Created by yhp on 16/3/22.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHPLoadMoreFooter;

@protocol YHPLoadMoreFooterDelegate <NSObject>
@optional
-(void)loadMoreFooterDidClickLoadMoreButton:(YHPLoadMoreFooter*)footer ;
@end


@interface YHPLoadMoreFooter : UIView

+(instancetype)footer;

/** 代理 */
@property(nonatomic,weak)id<YHPLoadMoreFooterDelegate> delegate;

/**
 *  结束加载
 */
-(void)endLoading;
@end
