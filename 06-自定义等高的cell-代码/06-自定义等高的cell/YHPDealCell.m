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
@property (weak, nonatomic)  UIImageView *iconView;
@property (weak, nonatomic)  UILabel *titLelabel;
@property (weak, nonatomic)  UILabel *priceLabel;
@property (weak, nonatomic)  UILabel *buyCountLabel;

@end


@implementation YHPDealCell

+(instancetype)cellWithtableView:(UITableView*)tableView
{
    static NSString* ID = @"deal";
    YHPDealCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[YHPDealCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

// 1，initWithFram方法中添加子控件
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        UIImageView* iconView = [[UIImageView alloc]init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        UILabel* titLelabel = [[UILabel alloc]init];
        [self.contentView addSubview:titLelabel];
        self.titLelabel = titLelabel;
        
        UILabel* priceLabel = [[UILabel alloc]init];
        priceLabel.textColor = [UIColor orangeColor];
        [self.contentView addSubview:priceLabel];
        self.priceLabel = priceLabel;
        
        UILabel* buyCountLabel = [[UILabel alloc]init];
        buyCountLabel.textAlignment = NSTextAlignmentRight;
        buyCountLabel.font = [UIFont systemFontOfSize:14];
        buyCountLabel.textColor = [UIColor grayColor]; 
        [self.contentView addSubview:buyCountLabel];
        self.buyCountLabel = buyCountLabel;
        
    }
    return self;
}
// 2，在layoutSubviews方法中设置子控件的frame
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat contentViewW = self.contentView.frame.size.width;
    CGFloat contentViewH = self.contentView.frame.size.height;
    CGFloat margin = 10;
//    设置iconView
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    CGFloat iconW = 100;
    CGFloat iconH = contentViewH - 2 * iconY;
    self.iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
//   设置tittleLabel
    CGFloat tittleX = CGRectGetMaxX(self.iconView.frame) + margin;
    CGFloat tittleY = iconY;
    CGFloat tittleW = contentViewW - tittleX - margin;
    CGFloat tittleH = 21;
    self.titLelabel.frame = CGRectMake(tittleX, tittleY, tittleW, tittleH);
//  设置priceLabel
    CGFloat priceX = tittleX;
    CGFloat priceH = tittleH;
    CGFloat priceY = contentViewH - margin - priceH;
    CGFloat priceW = contentViewW- tittleX - margin;
    self.priceLabel.frame = CGRectMake(priceX, priceY, priceW, priceH);
//  设置buyCountLabel
    CGFloat buyCountH = priceH;
    CGFloat buyCountY = priceY;
    CGFloat buyCountX = CGRectGetMaxY(self.priceLabel.frame) + margin;
    CGFloat buyCountW = contentViewW- buyCountX - margin;
    self.buyCountLabel.frame = CGRectMake(buyCountX, buyCountY, buyCountW, buyCountH);
}
// 3, 重写模型的set方法
-(void)setDeal:(YHPDeal *)deal
{
    //    赋值
     _deal = deal;
    self.iconView.image = [UIImage imageNamed:deal.icon];
    self.titLelabel.text = deal.title;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@", deal.price];
    self.buyCountLabel.text = [NSString stringWithFormat:@"%@人已购买", deal.buyCount];
}

@end
