//
//  YHPShopView.h
//  03-综合使用
//
//  Created by yhp on 16/2/28.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHPShop;
@interface YHPShopView : UIView

/** 模型数据 */
@property(nonatomic,strong)YHPShop* shop;

+(instancetype)shopView;
+(instancetype)shopViewWithShop:(YHPShop*)shop;

//  接口的设计

@end
