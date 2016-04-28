//
//  YHPPageView.h
//  04-UIScrolView-分页
//
//  Created by yhp on 16/2/29.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHPPageView : UIView

/** 图片数据 */
@property(nonatomic,strong)NSArray* imageName;

+(instancetype)pageView;
@end
