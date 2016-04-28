//
//  YHPHero.h
//  06-UITableView-单组数据
//
//  Created by yhp on 16/3/7.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHPHero : NSObject

/** name */
@property(nonatomic,strong)NSString* name;
/** 图标 */
@property(nonatomic,strong)NSString* icon;
/** 简介 */
@property(nonatomic,strong)NSString* intro;

+ (instancetype)heroWithDict:(NSDictionary*)dict;
@end
