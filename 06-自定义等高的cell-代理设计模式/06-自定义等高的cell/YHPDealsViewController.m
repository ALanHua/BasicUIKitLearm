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

@interface YHPDealsViewController () <YHPLoadMoreFooterDelegate>
/** 所有的团购数据 */
@property(nonatomic,strong)NSMutableArray* deals;

@end

@implementation YHPDealsViewController
/**
 *  代理设计模式的作用
 *  1，A对象监听B对象的一些行为，A要成为B对象的代理
 *  2，B对象想告诉A对象一些事情，B要成为A的代理
 *
 *  代理设计模式总结：
 *  如果你想监听别人的一些行为，那么就要成为别人的代理
 *  如果你想告诉别人一些事情，那么久别人成为你的代理
 *  代理设计模式使用的步骤：
 *  1，拟一份协议（协议名字的格式，控件名 + Delegate,在协议里面声明一些代理方法(一般代理方法都是Optional)
 *  2，声明一份代理属性：@property(nonatomic,weak)id<代理协议> delegate;
 *  3，在内部发生某些行为时，调用代理对应的代理方法，通知代理内部发生的某些变化
 *  4，yyy对象遵守代理协议，实现代理方法
 */
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
    
    YHPLoadMoreFooter* footer = [YHPLoadMoreFooter footer];
    footer.delegate = self;
    self.tableView.tableFooterView = footer;
    
    YHPPageView* pageView = [YHPPageView pageView];
    pageView.imageNames = @[@"37e4761e6ecf56a2d78685df7157f097",@"37e4761e6ecf56a2d78685df7157f097",
            @"37e4761e6ecf56a2d78685df7157f097",@"37e4761e6ecf56a2d78685df7157f097"];
    self.tableView.tableHeaderView = pageView;

    //  监听更多的通知
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loadMoreDeals) name:@"loadMore" object:nil];
}

//-(void)dealloc
//{
//    [[NSNotificationCenter defaultCenter]removeObserver:self];
//}

#pragma mark - <YHPLoadMoreFooterDelegate>
-(void)loadMoreFooterDidClickLoadMoreButton:(YHPLoadMoreFooter *)footer
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
