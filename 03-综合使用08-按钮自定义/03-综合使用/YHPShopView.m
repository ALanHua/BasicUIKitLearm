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
@end

@implementation YHPShopView

+(instancetype)shopView
{
    return [self shopViewWithShop:nil];
}
+(instancetype)shopViewWithShop:(YHPShop*)shop
{
    YHPShopView* shopView = [[self alloc]init];
    shopView.shop = shop;
    shopView.backgroundColor = [UIColor redColor];
//    shopView.imageView.backgroundColor = [UIColor blueColor];
//    shopView.titleLabel.backgroundColor = [UIColor yellowColor];
    return shopView;
}
-(void)setShop:(YHPShop *)shop
{
    _shop = shop;
    
    if(shop.icon){
        [self setImage:[UIImage imageNamed:shop.icon] forState:UIControlStateNormal];
    }
    
    [self setTitle:shop.name forState:UIControlStateNormal];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        
    }
    
    return self;
}

//- (CGRect)imageRectForContentRect:(CGRect)contentRect
//{
//    return CGRectMake(0, 0, 30, 30);
//}
//
//-(CGRect)titleRectForContentRect:(CGRect)contentRect
//{
//    return CGRectMake(0, 30, 70, 30);
//}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat bottonW = self.bounds.size.width;
    CGFloat buttonH = self.bounds.size.height;
    CGFloat imageH = bottonW - 10;
    self.imageView.frame = CGRectMake(0, 0, bottonW, imageH);
    self.titleLabel.frame = CGRectMake(0, imageH, bottonW, buttonH-imageH);
    
}

@end
