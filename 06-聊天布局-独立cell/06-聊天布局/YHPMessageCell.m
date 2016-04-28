//
//  YHPMessageCell.m
//  06-聊天布局
//
//  Created by yhp on 16/3/15.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPMessageCell.h"
#import "YHPMessage.h"
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND//一定要添加到massory.h的前面
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS// 自动包装
#import "Masonry.h"

@interface YHPMessageCell ()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *textButton;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation YHPMessageCell

-(void)awakeFromNib
{
    self.textButton.titleLabel.numberOfLines = 0;//自动换行
}

-(void)setMessage:(YHPMessage *)message
{
    _message = message;
    
    self.timeLabel.hidden = message.hideTime;
    
    if (message.hideTime) {
        self.timeLabel.hidden = YES;
        [self.timeLabel updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(0);
        }];
    }else{
        self.timeLabel.text = message.time;
        self.timeLabel.hidden = NO;
        [self.timeLabel updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(21);
        }];
    }
    
    //  设置按钮文字
    [self.textButton setTitle:self.message.text forState:UIControlStateNormal];
    //  需要强制更新
    [self  layoutIfNeeded];
    //  设置按钮高度就是文字高度
    [self.textButton  updateConstraints:^(MASConstraintMaker *make) {
        CGFloat buttonH = self.textButton .titleLabel.frame.size.height + 30;
        make.height.equalTo(buttonH);
    }];
    //  需要强制更新
    [self layoutIfNeeded];
    //  计算出cell的高度
    CGFloat bottonY = CGRectGetMaxY(self.textButton .frame);
    CGFloat iconMAxY = CGRectGetMaxY(self.iconView.frame);
    self.message.cellHeight = MAX(bottonY, iconMAxY) + 10;
    
}


@end
