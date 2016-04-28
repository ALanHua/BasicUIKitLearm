//
//  YHPOtherCell.h
//  06-聊天布局
//
//  Created by yhp on 16/3/21.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHPMessage;
@interface YHPOtherCell : UITableViewCell

/** 模型 */
@property(nonatomic,strong)YHPMessage* message;
@end
