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
//    UIImageView* iconView = (UIImageView*)[self viewWithTag:10];
    self.iconView.image = [UIImage imageNamed:deal.icon];
    
//    UILabel* titleLabel = (UILabel*)[self viewWithTag:20];
    self.titLelabel.text = deal.title;
    
//    UILabel* priceLabel = (UILabel*)[self viewWithTag:30];
     self.priceLabel.text = [NSString stringWithFormat:@"￥%@", deal.price];
    
//    UILabel* buyCountLabel = (UILabel*)[self viewWithTag:40];
    self.buyCountLabel.text = [NSString stringWithFormat:@"%@人已购买", deal.buyCount];
    
    
}

@end
