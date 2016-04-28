//
//  ViewController.m
//  06-tableView的代理
//
//  Created by yhp on 16/3/8.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

NSString* ID = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text = [NSString stringWithFormat:@"t456456546 - %zd", indexPath.row];
    
    return cell;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"hello";
}
#pragma mark - <UITableViewDelegate>
/**
 *  选中某一行的时候回调用
 *
 *  @param tableView
 *  @param indexPath 被点击哪一行
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select - %zd", indexPath.row);
}
/**
 *  取消选中某一行时调用
 */
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSLog(@"de - %zd", indexPath.row);
}

/**
 *  第几行的高度
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row % 2 == 0){
        return 50;
    }
    
    return 70;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
/**
 *  告诉tableView第section显示怎样的头部控件
 */
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIButton buttonWithType:UIButtonTypeInfoDark];
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIButton buttonWithType:UIButtonTypeInfoDark]; 
}

@end
