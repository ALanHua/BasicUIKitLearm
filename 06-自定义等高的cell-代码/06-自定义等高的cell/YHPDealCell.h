//
//  YHPDealCell.h
//  06-自定义等高的cell
//
//  Created by yhp on 16/3/10.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHPDeal;
@interface YHPDealCell : UITableViewCell

/** 团购数据模型 */
@property(nonatomic,strong)YHPDeal* deal;


+(instancetype)cellWithtableView:(UITableView*)tableView;
@end
