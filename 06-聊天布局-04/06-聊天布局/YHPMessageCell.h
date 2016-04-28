//
//  YHPMessageCell.h
//  06-聊天布局
//
//  Created by yhp on 16/3/15.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHPMessage;
@interface YHPMessageCell : UITableViewCell

/** 模型 */
@property(nonatomic,strong)YHPMessage* message;
@end
