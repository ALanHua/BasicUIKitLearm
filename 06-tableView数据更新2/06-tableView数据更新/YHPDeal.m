//
//  YHPDeal.m
//  06-自定义等高的cell
//
//  Created by yhp on 16/3/10.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPDeal.h"

@implementation YHPDeal

+(instancetype)dealWithDict:(NSDictionary*)dict
{
    
    YHPDeal* deal = [[YHPDeal alloc]init];
//    deal.title = dict[@"title"];
//    deal.icon = dict[@"icon"];
//    deal.buyCount = dict[@"buyCount"];
//    deal.price = dict[@"price"];
    //    KVC 技术
    [deal setValuesForKeysWithDictionary:dict];//相当于上面的4句
    return deal;
}
@end
