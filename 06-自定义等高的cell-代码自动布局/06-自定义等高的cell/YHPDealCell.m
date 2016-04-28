//
//  YHPDealCell.m
//  06-自定义等高的cell
//
//  Created by yhp on 16/3/10.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPDealCell.h"
#import "YHPDeal.h"
// 第三方框架
#define MAS_SHORTHAND//一定要添加到massory.h的前面
#define MAS_SHORTHAND_GLOBALS// 自动包装
#import "Masonry.h"

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
    CGFloat margin = 10;
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        UIImageView* iconView = [[UIImageView alloc]init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        [iconView makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(100);
            make.left.top.equalTo(self.contentView).offset(margin);
            make.bottom.equalTo(self.contentView).offset(-10);
        }];
        
        UILabel* titLelabel = [[UILabel alloc]init];
        [self.contentView addSubview:titLelabel];
        self.titLelabel = titLelabel;
        [titLelabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(iconView);
            make.left.equalTo(iconView.right).offset(margin);
            make.right.equalTo(self.contentView).offset(-margin);
        }];
        
        UILabel* priceLabel = [[UILabel alloc]init];
        priceLabel.textColor = [UIColor orangeColor];
        [self.contentView addSubview:priceLabel];
        self.priceLabel = priceLabel;
        [priceLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(iconView.right).offset(margin);
            make.bottom.equalTo(self.contentView).offset(-margin);
        }];
        
        UILabel* buyCountLabel = [[UILabel alloc]init];
        buyCountLabel.textAlignment = NSTextAlignmentRight;
        buyCountLabel.font = [UIFont systemFontOfSize:14];
        buyCountLabel.textColor = [UIColor grayColor]; 
        [self.contentView addSubview:buyCountLabel];
        self.buyCountLabel = buyCountLabel;
        [buyCountLabel makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-margin);
            make.bottom.equalTo(self.contentView).offset(-margin);
            make.left.equalTo(priceLabel).offset(margin);
        }];
    }
    return self;
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
