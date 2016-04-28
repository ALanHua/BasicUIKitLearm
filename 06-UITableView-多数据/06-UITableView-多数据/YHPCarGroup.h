//
//  YHPCarGroup.h
//  06-UITableView-多数据
//
//  Created by yhp on 16/3/7.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHPCarGroup : NSObject
/** 头部标题 */
@property(nonatomic,strong)NSString* header;
/** 尾部标题 */
@property(nonatomic,strong)NSString* footer;
/** 这组所有的车模型 */
@property(nonatomic,strong)NSArray* cars;
@end
