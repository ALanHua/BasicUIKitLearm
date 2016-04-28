//
//  ViewController.m
//  06-性能优化
//
//  Created by yhp on 16/3/8.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView* tableview = [[UITableView alloc]initWithFrame: self.view.bounds style:UITableViewStyleGrouped];
    tableview.frame = self.view.bounds;
    tableview.dataSource = self;
    tableview.rowHeight = 70;
    [self.view addSubview:tableview];

}

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //  0，重用标识
    //  被static修饰的局部变量永远只初始化一次
    static NSString* ID = @"fsdfds";
    //  1，先根据cell的标识去缓存池中寻址
    UITableViewCell* cell =  [tableView dequeueReusableCellWithIdentifier:ID];
    //  2,如果cell为nil
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    //    覆盖数据
    cell.textLabel.text = [NSString stringWithFormat:@"test...%zd",indexPath.row];
  
    return cell;
}




@end
