//
//  YHPStatusCell.m
//  06-自定义非等高cell-xib
//
//  Created by yhp on 16/3/12.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPStatusCell.h"
#import "YHPStatus.h"

@interface YHPStatusCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *vipView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet UIImageView *pictureView;

@end

@implementation YHPStatusCell

+ (instancetype)cellWithTableView:(UITableView*)tableView
{
    static NSString* ID = @"status";
    YHPStatusCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell =  [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
    }
    return cell;
}
-(void)awakeFromNib
{
    //    设置文字的最大宽度
    //    保证算出来的值和显示出来的效果一直
    self.contentLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
}

-(void)setStatus:(YHPStatus *)status
{
    _status = status;
    if (status.isVip) {
        self.nameLabel.textColor = [UIColor orangeColor];
        self.vipView.hidden = NO;
    }else{
        self.nameLabel.textColor = [UIColor blackColor];
        self.vipView.hidden = YES;
    }
    
    self.nameLabel.text = status.name;
    self.iconView.image = [UIImage imageNamed:status.icon];
    if(status.picture){
        self.pictureView.hidden = NO;
        self.pictureView.image = [UIImage imageNamed:status.picture];
    }else{
        self.pictureView.hidden = YES;
    }
    self.contentLabel.text = status.text;
    //    强制布局
    [self layoutIfNeeded];
    //    计算cell的高度
    if (self.pictureView.hidden) {//没有图片
        status.cellHeight = CGRectGetMaxY(self.contentLabel.frame) + 10;
    }else{
         status.cellHeight =  CGRectGetMaxY(self.pictureView.frame) + 10 ;
    }
}

@end
