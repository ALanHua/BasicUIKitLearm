//
//  YHPTableViewController.m
//  06-常见设置
//
//  Created by yhp on 16/3/10.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPTableViewController.h"

@interface YHPTableViewController ()

@end

@implementation YHPTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //   分割线的颜色
    //    self.tableView.separatorColor = [UIColor redColor];
    //   影藏分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 80;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    /*
    //     非自动创建时最好这么用
    if(cell == nil){
        //    设置选中的背景色
        UIView* selectedBackgroundView  = [[UIView alloc]init];
        selectedBackgroundView.backgroundColor = [UIColor redColor];
        cell.selectedBackgroundView = selectedBackgroundView;
        //    设置默认的背景色
        cell.backgroundColor = [UIColor blueColor];
        //    设置默认的背景色
        UIView* backgroudView = [[UIView alloc]init];
        backgroudView.backgroundColor = [UIColor greenColor];
        cell.backgroundView = backgroudView;
    }*/
    cell.textLabel.text = @"1234";
    cell.imageView.image = [UIImage imageNamed:@"ad_00"];
    //    取消选中颜色
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    设置选中的背景色
    UIView* selectedBackgroundView  = [[UIView alloc]init];
    selectedBackgroundView.backgroundColor = [UIColor redColor];
    cell.selectedBackgroundView = selectedBackgroundView;
    //    设置默认的背景色
    cell.backgroundColor = [UIColor blueColor];
    //    设置默认的背景色
    UIView* backgroudView = [[UIView alloc]init];
    backgroudView.backgroundColor = [UIColor greenColor];
    cell.backgroundView = backgroudView;
    //    设置指示器
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.accessoryView = [[UISwitch alloc]init];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"1111----");
}



@end
