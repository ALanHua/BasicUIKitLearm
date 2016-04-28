//
//  YHPShopView.m
//  03-综合使用
//
//  Created by yhp on 16/2/28.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPShopView.h"
#import "YHPShop.h"

@interface YHPShopView ()
/** 图标 */
@property(nonatomic,weak)IBOutlet UIImageView* iconView;
/** 文字  */
@property(nonatomic,weak)IBOutlet UILabel* nameLabel;
@end

@implementation YHPShopView

+(instancetype)shopView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}
+(instancetype)shopViewWithShop:(YHPShop*)shop
{
    YHPShopView* shopView = [self shopView];
    shopView.shop = shop;
    return shopView;
}
-(void)setShop:(YHPShop *)shop
{
    _shop = shop;
//    方法1：设置子控件的数据
//    UIImageView* iconView = (UIImageView*) [self viewWithTag:10];
//    iconView.image = [UIImage imageNamed:shop.icon];
//    UILabel* nameLabel = (UILabel*) [self viewWithTag:20];
//    nameLabel.text = shop.name;
//    方法2：
//    UIImageView* iconView = [self.subviews firstObject];
//    iconView.image = [UIImage imageNamed:shop.icon];
//    UILabel* nameLabel = [self.subviews lastObject];
//    nameLabel.text = shop.name;
//    最好的方法
    
    
    self.iconView.image = [UIImage imageNamed:shop.icon];
    self.nameLabel.text = shop.name;
    
}

@end
