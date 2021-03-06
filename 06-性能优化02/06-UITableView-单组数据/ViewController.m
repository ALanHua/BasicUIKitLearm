//
//  ViewController.m
//  06-UITableView-单组数据
//
//  Created by yhp on 16/3/7.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
#import "YHPHero.h"
@interface ViewController () <UITableViewDataSource>
/** 英雄数据 */
@property(nonatomic,strong)NSArray* heroes;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

NSString* ID = @"hero";

@implementation ViewController

- (NSArray*)heroes
{
    if (_heroes == nil) {
        //   加载plist
       NSString* path =[[NSBundle mainBundle] pathForResource:@"heroes.plist" ofType:nil];
        NSArray* dicArray = [NSArray arrayWithContentsOfFile:path];
        //  字典数组 --> 模型数组
        NSMutableArray* heroArray = [NSMutableArray array];
        for (NSDictionary* dict in dicArray) {
            YHPHero* hero = [YHPHero heroWithDict:dict];
            [heroArray addObject:hero];
        }
        
        _heroes = heroArray;
    }
    return _heroes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    注册Cell，如果没有回自动创建cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];//只能默认样式
}

#pragma mark - UITableViewDataSource>
// 默认就是1组
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heroes.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    性能优化
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
   
    /*
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }*/
    
    YHPHero* hero = self.heroes[indexPath.row];
    cell.textLabel.text = hero.name;
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    cell.detailTextLabel.text = hero.intro;
    
    return cell;
}

@end
