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
#import "YHPPageView.h"
#import "YHPLoadMoreFooter.h"

@interface YHPDealsViewController ()
/** 所有的团购数据 */
@property(nonatomic,strong)NSMutableArray* deals;

@end

@implementation YHPDealsViewController

// 懒加载
- (NSMutableArray*)deals
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
//    UINib* nib = [UINib nibWithNibName:NSStringFromClass([YHPDealCell class]) bundle:nil];
//    [self.tableView registerNib:nib forCellReuseIdentifier:@"deal"];
//    UIButton* logout = [UIButton buttonWithType:UIButtonTypeCustom];
//    [logout setTitle:@"退出登录" forState:UIControlStateNormal];
//    logout.frame = CGRectMake(0, 0, 100, 44);
//    logout.backgroundColor = [UIColor redColor];
//    [logout addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    YHPLoadMoreFooter* footer = [YHPLoadMoreFooter footer];
    self.tableView.tableFooterView = footer;
    
    YHPPageView* pageView = [YHPPageView pageView];
    pageView.imageNames = @[@"37e4761e6ecf56a2d78685df7157f097",@"37e4761e6ecf56a2d78685df7157f097",
            @"37e4761e6ecf56a2d78685df7157f097",@"37e4761e6ecf56a2d78685df7157f097"];
    self.tableView.tableHeaderView = pageView;

    //  监听更多的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loadMoreDeals) name:@"loadMore" object:nil];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void) loadMoreDeals
{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        YHPDeal* deal = [[YHPDeal alloc]init];
        deal.icon = @"a6c484045581f45e50db68e4f5dc734c";
        deal.title = @"xxxx";
        deal.price = @"12345";
        deal.buyCount = @"100";
        [self.deals addObject:deal];
        [self.tableView reloadData];
        // 结束footer的加载状态
        YHPLoadMoreFooter* footer = (YHPLoadMoreFooter*)self.tableView.tableFooterView;
        [footer endLoading];
    });

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
