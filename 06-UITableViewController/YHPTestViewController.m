//
//  YHPTestViewController.m
//  06-UITableViewController
//
//  Created by yhp on 16/3/9.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPTestViewController.h"

@interface YHPTestViewController ()

@end

@implementation YHPTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view 就是 self.tableView
    NSLog(@"%p,%p",self.view,self.tableView);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2 == 0) {
        return[self cell:tableView IndexPath:indexPath];
    }else {
        return[self cell2:tableView IndexPath:indexPath];
    }
}

#pragma mark - 代理方法

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath");
}

#pragma mark - 创建，设置cell
-(UITableViewCell*)cell:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath
{

        static NSString* ID = @"cell";
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
        cell.textLabel.text = [NSString stringWithFormat:@"yhp---%zd",indexPath.row];
        NSLog(@"%@",cell.contentView.subviews);
        return cell;
}

-(UITableViewCell*)cell2:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath
{
    
    static NSString* ID = @"cell2";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text = [NSString stringWithFormat:@"yhp---%zd",indexPath.row];
    NSLog(@"%@",cell.contentView.subviews);
    return cell;
}
@end
