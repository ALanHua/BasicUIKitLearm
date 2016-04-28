//
//  Shop.h
//  03-综合使用
//
//  Created by yhp on 16/2/25.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//
//存放商品数据的模型

#import <Foundation/Foundation.h>

@interface YHPShop : NSObject

/**商品名称*/
@property(nonatomic,strong)NSString* name;
/**图标*/
@property(nonatomic,strong)NSString* icon;

-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)shopWithDict:(NSDictionary*)dict;
@end
