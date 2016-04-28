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
@property(nonatomic,strong)NSArray* imageNames;

+(instancetype)pageView;

/** 其他圆点颜色 */
//@property(nonatomic,strong)UIColor* otherColor NS_DEPRECATED_IOS(1.0,2.0);
@property(nonatomic,strong)UIColor* otherColor;
/** 当前颜色 */
@property(nonatomic,strong)UIColor* currentColor;
@end
