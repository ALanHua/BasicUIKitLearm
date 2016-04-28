//
//  ViewController.m
//  06-UITableView-多数据
//
//  Created by yhp on 16/3/6.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPCar.h"
#import "YHPCarGroup.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/** 所有的组数据 */
@property(nonatomic,strong)NSArray* groups;
@end

@implementation ViewController
/**
 *  懒加载
 *  @return 数据
 */
- (NSArray*)groups
{
    //创建模型数据
    if(_groups == nil){
        YHPCarGroup* group0 = [[YHPCarGroup alloc]init];
        group0.header = @"德系";
        group0.footer = @"德系车66666";
        group0.cars = @[
                        [YHPCar carWithName:@"奥迪" icon:@"m_9_100"],
                        [YHPCar carWithName:@"奔驰" icon:@"m_3_100"],
                        [YHPCar carWithName:@"宝马" icon:@"m_2_100"]
                        ];
        
        YHPCarGroup* group1 = [[YHPCarGroup alloc]init];
        group1.header = @"日系";
        group1.footer = @"日系车77777";
        group1.cars = @[
                        [YHPCar carWithName:@"奥迪" icon:@"m_9_100"],
                        [YHPCar carWithName:@"奔驰" icon:@"m_3_100"],
                        [YHPCar carWithName:@"宝马" icon:@"m_2_100"]
                        ];
        _groups = @[group0,group1];
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //    设置数据源
    self.tableView.dataSource = self;
}

#pragma mark - <UITableViewDataSource>
/**
 *  告诉tableview第section组
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    YHPCarGroup* group = self.groups[section];
    return group.cars.count;
}

/**
 *  告诉tableBiew一共有多少组数据
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

/**
 *  行上显示的内容
 */
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [[UITableViewCell alloc]init];
    YHPCarGroup* group = self.groups[indexPath.section];
    YHPCar* car = group.cars[indexPath.row];
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    
    return cell;
}

/**
 * 头标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    YHPCarGroup* group = self.groups[section];
    return group.header;
}
/**
 *  尾标题
 */
-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    YHPCarGroup* group = self.groups[section];
    return group.footer;
}

@end
