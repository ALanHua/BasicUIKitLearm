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

- (IBAction)add {
    //    创建弹框控制器
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"请输入团购信息" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        //  创建模型
        YHPDeal* deal = [[YHPDeal alloc]init];
        deal.title = [alert.textFields[0] text];;
        deal.price = [alert.textFields[1] text];;
        deal.buyCount = [alert.textFields[2] text];;
        [self.deals insertObject:deal atIndex:0];
        [self.tableView layoutIfNeeded];
    }]];
    //    添加文本输入
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入团购名字";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入价格";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入购买数量";
    }];
    [self presentViewController:alert animated:YES completion:nil];
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
