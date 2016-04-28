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

- (IBAction)add {
//    tableView里面需要显示新的cell数据，只要操作模型数据
    YHPDeal* deal = [[YHPDeal alloc]init];
    deal.title = [NSString stringWithFormat:@"打%d折",arc4random_uniform(50)];
    deal.price = [NSString stringWithFormat:@"%d",10 + arc4random_uniform(100)];
    deal.buyCount = [NSString stringWithFormat:@"%d",arc4random_uniform(1000)];
    deal.icon = @"2c97690e72365e38e3e2a95b934b8dd2";
    [self.deals insertObject:deal atIndex:0];
    
    YHPDeal* deal2 = [[YHPDeal alloc]init];
    deal2.title = [NSString stringWithFormat:@"打%d折",arc4random_uniform(50)];
    deal2.price = [NSString stringWithFormat:@"%d",10 + arc4random_uniform(100)];
    deal2.buyCount = [NSString stringWithFormat:@"%d",arc4random_uniform(1000)];
    deal2.icon = @"2c97690e72365e38e3e2a95b934b8dd2";
    [self.deals insertObject:deal2 atIndex:0];
    //  提醒tableView 模型数据发生了变化，请重新事变，重新向数据源要数据
//    [self.tableView reloadData];
    //    刷新默写特定行
    [self.tableView insertRowsAtIndexPaths:@[
                    [NSIndexPath indexPathForRow:0 inSection:0],
                    [NSIndexPath indexPathForRow:1. inSection:0]
                ] withRowAnimation:UITableViewRowAnimationLeft];
}

- (IBAction)remove {
//    移除数据
    [self.deals removeObjectAtIndex:0];
    [self.deals removeObjectAtIndex:0];
//    刷新表格
//    [self.tableView reloadData];
    [self.tableView deleteRowsAtIndexPaths :@[
                          [NSIndexPath indexPathForRow:0 inSection:0],
                          [NSIndexPath indexPathForRow:1 inSection:0]
                     ] withRowAnimation:UITableViewRowAnimationRight];
}
- (IBAction)update {
    YHPDeal* deal = self.deals[3];
    deal.price = [NSString stringWithFormat:@"%d",50 + arc4random_uniform(100)];;
    //    刷新表格
    [self.tableView reloadRowsAtIndexPaths:@[
                        [NSIndexPath indexPathForRow:3 inSection:0]
                    ] withRowAnimation:UITableViewRowAnimationMiddle];
}
- (IBAction)switchEditing {
//    进入编辑模式
//    self.tableView.editing = YES;
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
/*
 * 只要实现这个方法，就会出现删除按钮
 * 用户点击了删除按钮会调用这个方法
 */
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.deals removeObjectAtIndex:indexPath.row];
        //    刷新表格
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }

}

/**
 * 决定编辑模每一行的编辑类型，删除--插入
 */
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return indexPath.row % 2 == 0 ? UITableViewCellEditingStyleInsert : UITableViewCellEditingStyleDelete;
//}



@end
