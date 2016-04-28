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
@property (weak, nonatomic) IBOutlet UIButton *otherTextButton;
@property (weak, nonatomic) IBOutlet UIImageView *otherIconView;

@end

@implementation YHPMessageCell

-(void)awakeFromNib
{
//    self.textButton.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    self.textButton.titleLabel.numberOfLines = 0;//自动换行
    self.otherTextButton.titleLabel.numberOfLines = 0;//自动换行
    //self.textButton.titleLabel.backgroundColor = [UIColor redColor];
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
    if (message.type == YHPMessageTypeMe) {//右边
        [self settingTextButton:self.textButton showIconView:self.iconView hideTextButton:self.otherTextButton hideIconView:self.otherIconView];
    }else {//左边
        [self settingTextButton:self.otherTextButton showIconView:self.otherIconView hideTextButton:self.textButton hideIconView:self.iconView];
    }

}


-(void)settingTextButton:(UIButton*)showTextButton showIconView:(UIImageView*)showIconView hideTextButton:(UIButton*)hideTextButton hideIconView:(UIImageView*)hideIconView
{
    showTextButton.hidden = NO;
    showIconView.hidden = NO;
    hideTextButton.hidden = YES;
    hideIconView.hidden = YES;
    //  设置按钮文字
    [showTextButton setTitle:self.message.text forState:UIControlStateNormal];
    //  需要强制更新
    [showTextButton layoutIfNeeded];
    //  设置按钮高度就是文字高度
    [showTextButton updateConstraints:^(MASConstraintMaker *make) {
        CGFloat buttonH = showTextButton.titleLabel.frame.size.height + 30;
        make.height.equalTo(buttonH);
    }];
    //  需要强制更新
    [showTextButton layoutIfNeeded];
    //  计算出cell的高度
    CGFloat bottonY = CGRectGetMaxY(showTextButton.frame);
    CGFloat iconMAxY = CGRectGetMaxY(showIconView.frame);
    self.message.cellHeight = MAX(bottonY, iconMAxY) + 10;
    
}


@end
