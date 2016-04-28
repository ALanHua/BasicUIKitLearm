//
//  YHPShopView.m
//  03-综合使用
//
//  Created by yhp on 16/2/26.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPShopView.h"
#import "YHPShop.h"

/** 类扩展 */
@interface YHPShopView ()
/** 图片控件 */
@property(nonatomic,strong)UIImageView* iconView;
/**  文字控件 */
@property(nonatomic,strong)UILabel* nameLabel;
@end

@implementation YHPShopView
//懒加载
//-(UIImageView*)iconView
//{
//    if (_iconView == nil) {
//        UIImageView* iconView = [[UIImageView alloc]init];
//        iconView.backgroundColor = [UIColor blueColor];
//        [self addSubview:iconView];
//        _iconView = iconView;
//    }
//    return _iconView;
//}
//
//-(UILabel*)nameLabel
//{
//    if (_nameLabel == nil) {
//        UILabel* nameLabel = [[UILabel alloc]init];
//        nameLabel.font = [UIFont systemFontOfSize:11];
//        nameLabel.textAlignment = NSTextAlignmentCenter;
//        nameLabel.backgroundColor = [UIColor redColor];
//        [self addSubview:nameLabel];
//        _nameLabel = nameLabel;
//    }
//    
//    return _nameLabel;
//}
/**
 * init方法内部会自动调用initWithFrame方法
 */
-(instancetype)initWithFrame:(CGRect)frame//frame可能为空
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor orangeColor];
        //    添加图片
        UIImageView* iconView = [[UIImageView alloc]init];
        iconView.backgroundColor = [UIColor blueColor];
        [self addSubview:iconView];
        self.iconView = iconView;
        //    添加文字
        UILabel* nameLabel = [[UILabel alloc]init];
        nameLabel.font = [UIFont systemFontOfSize:11];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.backgroundColor = [UIColor redColor];
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
    }
    
    return self;
}
/**
 * 便利类方法
 */
+(instancetype)shopView
{
    return  [[self alloc]init];
}
/**
 这个方法专门用来布局子控件，一般在这里设置子控件的frame
 当控件本身的尺寸发生改变的时候是，系统会自动调用该方法
 */
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat shopW = self.frame.size.width;
    CGFloat shopH = self.frame.size.height;
    
    self.iconView.frame = CGRectMake(0, 0, shopW, shopW);
    self.nameLabel.frame = CGRectMake(0, shopW, shopW, shopH - shopW);
}

-(void)setShop:(YHPShop *)shop
{
    _shop = shop;
    self.nameLabel.text = shop.name;
    self.iconView.image = [UIImage imageNamed:shop.icon];
}

@end
