//
//  YHPDeal.h
//  06-自定义等高的cell
//
//  Created by yhp on 16/3/10.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHPDeal : NSObject
/** 购买数量 */
@property(nonatomic,strong)NSString* buyCount;
/** 价格 */
@property(nonatomic,strong)NSString* price;
/** 标题 */
@property(nonatomic,strong)NSString* title;
/** 图片 */
@property(nonatomic,strong)NSString* icon;


+(instancetype)dealWithDict:(NSDictionary*)dict;
@end
