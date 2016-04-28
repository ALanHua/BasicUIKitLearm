//
//  YHPMessage.h
//  06-聊天布局
//
//  Created by yhp on 16/3/15.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    YHPMessageTypeMe     = 0,
    YHPMessageTypeOther  = 1
}YHPMessageType;

@interface YHPMessage : NSObject
/** 内容 */
@property(nonatomic,strong)NSString* text;
/** 时间 */
@property(nonatomic,strong)NSString* time;
/** 类型 */
@property(nonatomic,assign)YHPMessageType type;
/** cell 高度 */
@property(nonatomic,assign)CGFloat cellHeight;
/** 是否要影藏时间 */
@property(nonatomic,assign,getter=isHideTime)BOOL hideTime;
+(instancetype)messageWithDict:(NSDictionary*)dict;

@end
