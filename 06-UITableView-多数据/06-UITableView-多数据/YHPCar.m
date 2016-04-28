//
//  YHPCar.m
//  06-UITableView-多数据
//
//  Created by yhp on 16/3/7.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPCar.h"

@implementation YHPCar
+(instancetype)carWithName:(NSString*)name icon:(NSString*)icon
{
    YHPCar* car = [[self alloc]init];
    car.name = name;
    car.icon = icon;
    return car;
}
@end
