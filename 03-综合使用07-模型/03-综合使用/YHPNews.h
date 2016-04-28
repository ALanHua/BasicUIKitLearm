//
//  YHPNews.h
//  03-综合使用
//
//  Created by yhp on 16/2/26.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHPNews : NSObject

/** 图片 */
@property(nonatomic,strong)NSString* icon;
/** 标题 */
@property(nonatomic,strong)NSString* tittle;
/** 摘要 */
@property(nonatomic,strong)NSString* digest;
/** 跟贴数 */
@property(nonatomic,assign)int followcount;

@end
