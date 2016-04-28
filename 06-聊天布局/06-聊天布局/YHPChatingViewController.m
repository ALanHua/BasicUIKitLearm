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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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





@end
