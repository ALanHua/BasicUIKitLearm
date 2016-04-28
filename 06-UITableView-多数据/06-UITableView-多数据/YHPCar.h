//
//  YHPCar.h
//  06-UITableView-多数据
//
//  Created by yhp on 16/3/7.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHPCar : NSObject
/** 名字 */
@property(nonatomic,strong)NSString* name;
/** 图标 */
@property(nonatomic,strong)NSString* icon;
+(instancetype)carWithName:(NSString*)name icon:(NSString*)icon;
@end
