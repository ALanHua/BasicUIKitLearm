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
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonSpacing;
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
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object: nil];
    //    监听键盘隐藏
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)dealloc
{
    //    如果这个biew死掉了，避免通知中心还去找这个通知
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
#pragma mark - 键盘处理函数
- (void)keyboardWillShow:(NSNotification*)note {
    //    取出键盘的frame
    CGRect rect = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.buttonSpacing.constant = rect.size.height;
    
    double duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
    }];
}

-(void)keyboardWillHide:(NSNotification*)note{
    double duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    self.buttonSpacing.constant = 0;
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
    }];
}

#pragma mark - <UITableViewDataSource>
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messages.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YHPMessageCell* cell = [tableView dequeueReusableCellWithIdentifier:@"message"];
    cell.message = self.messages[indexPath.row];
    
    
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
