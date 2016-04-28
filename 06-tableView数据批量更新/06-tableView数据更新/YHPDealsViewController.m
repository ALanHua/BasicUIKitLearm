//
//  YHPDealsViewController.m
//  06-自定义等高的cell
//
//  Created by yhp on 16/3/10.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPDealsViewController.h"
#import "YHPDeal.h"
#import "YHPDealCell.h"

@interface YHPDealsViewController () <UITableViewDataSource,UITableViewDelegate>
/** 所有的团购数据 */
@property(nonatomic,strong)NSMutableArray* deals;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YHPDealsViewController

// 懒加载
- (NSMutableArray *)deals
{
    if (_deals == nil) {
        NSString* path = [[NSBundle mainBundle]pathForResource:@"deals.plist" ofType:nil];
        NSArray* dictArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray* dealArray = [NSMutableArray array];
        for (NSDictionary* dict in dictArray) {
            YHPDeal* deal = [YHPDeal dealWithDict:dict];
            [dealArray addObject:deal];
        }
        _deals = dealArray;
    }
    return _deals;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - 按钮
- (IBAction)remove {
//    临时数组
    NSMutableArray* deletedDeals = [NSMutableArray array];
    for (YHPDeal* deal in self.deals) {
        if (deal.isChecked) {
            [deletedDeals addObject:deal];
        }
    }
//    删除数据
    NSLog(@"%@",deletedDeals);
    [self.deals removeObjectsInArray:deletedDeals];
//    刷新表格
    [self.tableView reloadData];
}



#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//  只调用一次
    return self.deals.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //    创建cell
    YHPDealCell* cell = [YHPDealCell cellWithTableView:tableView];
    //    取出模型数据
    cell.deal = self.deals[indexPath.row];

    return cell;
}

#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //  将模型的属性取反
    YHPDeal* deal = self.deals[indexPath.row];
    deal.checked = !deal.isChecked;
    //  刷新表格
    [tableView reloadData];
}


@end
