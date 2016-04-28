//
//  YHPChatingViewController.m
//  06-聊天布局
//
//  Created by yhp on 16/3/15.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPChatingViewController.h"
#import "YHPMessage.h"
#import "YHPMessageCell.h"

@interface YHPChatingViewController ()<UITableViewDataSource, UITableViewDelegate>
/** 数据 */
@property(nonatomic,strong)NSArray* messages;

@property (weak, nonatomic) IBOutlet UITextField *messsageField;
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonSpacing;
@end

@implementation YHPChatingViewController

#pragma mark - 数据加载
-(NSArray*)messages
{
    if (_messages == nil) {
        NSString* path = [[NSBundle mainBundle]pathForResource:@"messages.plist" ofType:nil];
        NSArray* dictArray = [NSArray arrayWithContentsOfFile:path];
        //  存储数据
        YHPMessage* lastMessage = nil;
        NSMutableArray* messageArray = [NSMutableArray array];
        for (NSDictionary* dict in dictArray) {
            YHPMessage* message = [YHPMessage messageWithDict:dict];
            message.hideTime = [message.time isEqual:lastMessage.time];
            [messageArray addObject:message];
            
            lastMessage = message;
        }
        _messages = messageArray;
    }
    return _messages;
}
#pragma mark - controller
- (void)viewDidLoad {
    [super viewDidLoad];
//    设置文本框左边的内容
    UIView* leftView = [[UIView alloc]init];
//    leftView.backgroundColor = [UIColor redColor];
    leftView.frame = CGRectMake(0, 0, 10, 0);
    self.messsageField.leftView = leftView;
    self.messsageField.leftViewMode = UITextFieldViewModeAlways;
    
    //    监听键盘通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object: nil];
}

-(void)dealloc
{
    //    如果这个biew死掉了，避免通知中心还去找这个通知
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
#pragma mark - 键盘处理函数
- (void)keyboardWillChangeFrame:(NSNotification*)note {
    // 取出键盘最终的frame
    CGRect rect = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 取出键盘弹出需要花费的时间
    double duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    // 修改transform
    [UIView animateWithDuration:duration animations:^{
        CGFloat ty = [UIScreen mainScreen].bounds.size.height - rect.origin.y;
        self.view.transform = CGAffineTransformMakeTranslation(0, - ty);
    }];
}

#pragma mark - <UITableViewDataSource>
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messages.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    取出模型
    YHPMessage* msg = self.messages[indexPath.row];
    NSString* ID = msg.type == YHPMessageTypeMe ? @"me" : @"other";
    YHPMessageCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.message = msg;
    return cell;
}

#pragma mark - <UITableViewDelegate>

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YHPMessage* message = self.messages[indexPath.row];
    
    return message.cellHeight;
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //   退出键盘
//    [self.messsageField resignFirstResponder];
//    [self.messsageField endEditing:YES];
    [self.view endEditing:YES];
    
}


@end
