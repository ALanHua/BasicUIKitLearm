//
//  YHPDealCell.m
//  06-自定义等高的cell
//
//  Created by yhp on 16/3/10.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPDealCell.h"
#import "YHPDeal.h"

@interface  YHPDealCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titLelabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;

@end


@implementation YHPDealCell

-(void)setDeal:(YHPDeal *)deal
{
    _deal = deal;
    //    赋值
    self.iconView.image = [UIImage imageNamed:deal.icon];
    self.titLelabel.text = deal.title;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@", deal.price];
    self.buyCountLabel.text = [NSString stringWithFormat:@"%@人已购买", deal.buyCount];
}

+(instancetype)cellWithTableView:(UITableView*)tableView
{
    static NSString* ID = @"deal";
    YHPDealCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YHPDealCell class]) owner:nil options:nil]lastObject];
        
    }
    return cell;
}

@end
