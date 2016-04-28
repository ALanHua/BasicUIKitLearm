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

/** 即将要删除的数据 */
@property(nonatomic,strong)NSMutableArray* deletedDeals;
@end

@implementation YHPDealsViewController

-(NSMutableArray*)deletedDeals
{
    if (!_deletedDeals) {
        _deletedDeals = [NSMutableArray array];
    }
    return _deletedDeals;
}

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
//    允许在编辑模式进行多选操作
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
}

#pragma mark - 按钮
- (IBAction)remove {
    // 获得所有被选中的行
    NSArray *indexPaths = [self.tableView indexPathsForSelectedRows];
    // 遍历获取行号
    NSMutableArray* deletedDeals = [NSMutableArray array];
    for (NSIndexPath* path  in indexPaths) {
        [deletedDeals addObject:self.deals[path.row]];
    }
    // 删除数据
    [self.deals removeObjectsInArray:deletedDeals];
    // 刷新表格
    [self.tableView reloadData];
}

- (IBAction)multiOperation {
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
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
    
}


@end
