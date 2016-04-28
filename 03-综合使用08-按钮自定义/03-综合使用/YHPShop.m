//
//  Shop.m
//  03-综合使用
//
//  Created by yhp on 16/2/25.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPShop.h"

@implementation YHPShop

-(instancetype)initWithDict:(NSDictionary*)dict
{
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
    }
    
    return self;
}

+(instancetype)shopWithDict:(NSDictionary*)dict
{
    return [[self alloc]initWithDict:dict];
}

@end
