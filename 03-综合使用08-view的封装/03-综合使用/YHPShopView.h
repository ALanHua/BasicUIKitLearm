//
//  YHPShopView.h
//  03-综合使用
//
//  Created by yhp on 16/2/26.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHPShop;

@interface YHPShopView : UIView

/** 商品模型 */
@property(nonatomic,strong)YHPShop* shop;

+(instancetype)shopView;

@end
