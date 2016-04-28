//
//  YHPStatusCell.h
//  06-自定义非等高cell-xib
//
//  Created by yhp on 16/3/12.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHPStatus;

@interface YHPStatusCell : UITableViewCell
/** 模型数据 */
@property(nonatomic,strong)YHPStatus* status;

+ (instancetype)cellWithTableView:(UITableView*)tableView;
@end
