//
//  YHPStatus.h
//  06-自定义非等高cell-xib
//
//  Created by yhp on 16/3/12.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "UIKit/UIKit.h"

@interface YHPStatus : NSObject
/** 姓名 */
@property(nonatomic,strong)NSString* name;
/** 内容 */
@property(nonatomic,strong)NSString* text;
/** 图标 */
@property(nonatomic,strong)NSString* icon;
/** 图片 */
@property(nonatomic,strong)NSString* picture;
/** 是否是vip */
@property(nonatomic,assign,getter=isVip)BOOL vip;

/** cell的高度 */
@property(nonatomic,assign)CGFloat cellHeight;

+ (instancetype)statusWithDict:(NSDictionary*)dict;

@end
