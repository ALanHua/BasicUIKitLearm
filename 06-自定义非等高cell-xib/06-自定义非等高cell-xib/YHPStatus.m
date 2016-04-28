//
//  YHPStatus.m
//  06-自定义非等高cell-xib
//
//  Created by yhp on 16/3/12.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPStatus.h"

@implementation YHPStatus

+ (instancetype)statusWithDict:(NSDictionary*)dict
{
    
    YHPStatus* status = [[self alloc]init];
    [status setValuesForKeysWithDictionary:dict];
    return status;
}
@end
