//
//  YHPStatusViewController.m
//  06-自定义非等高cell-xib
//
//  Created by yhp on 16/3/12.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPStatusViewController.h"
#import "YHPStatus.h"
#import "YHPStatusCell.h"

@interface YHPStatusViewController ()
/** 数据 */
@property(nonatomic,strong)NSArray* statuses;
/** 存放所有cell的高度 */
@property(nonatomic,strong)NSMutableDictionary* heights;
@end

@implementation YHPStatusViewController

-(NSArray*)statuses
{
    if (_statuses == nil) {
        //  加载plist
        NSString* path = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        NSArray* dictArray = [NSArray arrayWithContentsOfFile:path];
        //  字典数据到模型数据
        NSMutableArray* statusArray = [NSMutableArray array];
        for (NSDictionary* dict in dictArray) {
            YHPStatus* status = [YHPStatus statusWithDict:dict];
            [statusArray addObject:status];
        }
        _statuses = statusArray;
    }
    return _statuses;
}



- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YHPStatusCell* cell = [YHPStatusCell cellWithTableView:tableView];
    cell.status = self.statuses[indexPath.row];
//    //   强制布局
//    [cell layoutIfNeeded];
//    //   存储高度
//    self.heights[@(indexPath.row)] = @(cell.height);
    return cell;
}

#pragma mark - 代理方法
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    return [self.heights[@(indexPath.row)]doubleValue] ;
    YHPStatus* status = self.statuses[indexPath.row];
    return status.cellHeight;
}
//  返回每一行估计高度，只要返回估计高度，那么就会先cellForRowAtIndexPath，在
//  heightForRowAtIndexPath 性能优化）
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}
@end
