//
//  YHPMessage.m
//  06-聊天布局
//
//  Created by yhp on 16/3/15.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPMessage.h"

@implementation YHPMessage

+(instancetype)messageWithDict:(NSDictionary*)dict
{
    YHPMessage* message = [[self alloc]init];
    [message setValuesForKeysWithDictionary:dict];
    
    return message;
}
@end
