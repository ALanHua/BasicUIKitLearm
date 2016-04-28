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

@interface YHPDealsViewController ()
/** 所有的团购数据 */
@property(nonatomic,strong)NSArray* deals;

@end

@implementation YHPDealsViewController

// 懒加载
- (NSArray *)deals
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
    UINib* nib = [UINib nibWithNibName:NSStringFromClass([YHPDealCell class]) bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"deal"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.deals.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //    创建cell
    YHPDealCell* cell = [YHPDealCell cellWithTableView:tableView];
    //    取出模型数据
    cell.deal = self.deals[indexPath.row];

    return cell;
}


@end
