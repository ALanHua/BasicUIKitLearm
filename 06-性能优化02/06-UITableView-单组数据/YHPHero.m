//
//  YHPHero.m
//  06-UITableView-单组数据
//
//  Created by yhp on 16/3/7.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPHero.h"

@implementation YHPHero

+ (instancetype)heroWithDict:(NSDictionary*)dict
{
    YHPHero* hero = [[YHPHero alloc]init];
    hero.name = dict[@"name"];
    hero.icon = dict[@"icon"];
    hero.intro = dict[@"intro"];
    
    return hero;
}
@end
