//
//  ViewController.m
//  05-Massory的使用
//
//  Created by yhp on 16/3/6.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND//一定要添加到massory.h的前面
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS// 自动包装

#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    蓝色控件
    UIView* blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    //    红色控件
    UIView* redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    //    添加约束
    CGFloat margin = 20;
    CGFloat height = 50;
    [blueView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(margin);
        make.right.equalTo(redView.left).offset(-margin);
        make.bottom.equalTo(self.view.bottom).offset(-margin);
        make.height.equalTo(height);
        make.top.equalTo(redView.top);
        make.bottom.equalTo(redView.bottom);
        make.width.equalTo(redView.width);
    }];
    
    [redView makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.right).offset(-margin);
    }];
}
/**
 *  约束类型
    1 尺寸,width/height/size
    2 边界,left/leading/right/trailing/top/bottom
    3 中心点,center/centerX/centerY
    4 edge,边界
 */
-(void)test04
{
    UIView* blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    //    添加约束
    [blueView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.width).multipliedBy(0.5);
        make.height.equalTo(self.view.height).multipliedBy(0.5);
        make.centerX.equalTo(self.view.centerX);
        make.centerY.equalTo(self.view.centerY);
    }];
}
-(void)test03
{
    UIView* blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    // 距离父控件都是50间距
    //    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.mas_equalTo(self.view.mas_left).offset(50);
    //        make.right.mas_equalTo(self.view.mas_right).offset(-50);
    //        make.top.mas_equalTo(self.view.mas_top).offset(50);
    //        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-50);
    //    }];
    //    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.offset(50);
    //        make.right.offset(-50);
    //        make.top.offset(50);
    //        make.bottom.offset(-50);
    //    }];
    //    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.top.offset(50);
    //        make.right.bottom.offset(-50);
    //    }];
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(50, 50, 50, 50));
    }];
}
-(void)test02
{
    UIView* blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    //  居中（水平+垂直）
    //  尺寸是父控件的一半
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.view).multipliedBy(0.5);
        make.center.mas_equalTo(self.view);
        //        make.centerX.mas_equalTo(self.view);
        //        make.centerY.mas_equalTo(self.view);
        
    }];
}
-(void)test01
{
    
    UIView* blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    //   尺寸限制
    //    位置：粘着父控件右下角，间距20
    //    这个方法只会添加新的约束
    //    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
    ////        宽度约束
    //        make.width.equalTo(@100);
    ////        高度约束
    //        make.height.equalTo(@100);
    ////        右边
    //        make.right.equalTo(self.view.mas_right).offset(-20);
    ////        底部
    //        make.top.equalTo(self.view.mas_top).offset(20);
    //    }];
    
    //    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        // 宽度约束
    //        make.width.equalTo(@100);
    //        // 高度约束
    //        make.height.equalTo(@100);
    //        // 右边
    //        make.right.equalTo(self.view).offset(-20);
    //        // 底部
    //        make.top.equalTo(self.view).offset(20);
    //    }];
    //    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        // 宽度约束
    //        make.width.mas_equalTo(100);//自动将100包装成对象
    //        // 高度约束
    //        make.height.mas_equalTo(100);
    //        // 右边
    //        make.right.equalTo(self.view).offset(-20);
    //        // 底部
    //        make.top.equalTo(self.view).offset(20);
    //    }];
    //    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        // 宽度高度约束
    //        make.width.height.mas_equalTo(100);//自动将100包装成对象
    //        // 右边
    //        make.right.equalTo(self.view).offset(-20);
    //        // 底部
    //        make.top.equalTo(self.view).offset(20);
    //    }];
    
    //    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
    ////        make.size.mas_equalTo(CGSizeMake(100,100));
    //        make.size.mas_equalTo(100);
    //        // 右边
    //        make.right.equalTo(self.view).offset(-20);
    //        // 底部
    //        make.top.equalTo(self.view).offset(20);
    //    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.size.mas_equalTo(CGSizeMake(100,100));
        make.size.mas_equalTo(self.view).multipliedBy(0.5).offset(-50);
        // 右边
        make.right.mas_equalTo(self.view.mas_right).offset(-20);
        // 底部
        make.top.mas_equalTo(self.view.mas_top).offset(20);
    }];
    /**
     mas_equalTo 这个方法会对参数进行包装
     equalTo 这个方法不会对参数进行包装
     mas_equalTo的功能 > equalTo
     
     */
}
/**
 //  这个方法会将以前的所有约束删掉，添加新的约束
 [blueView mas_remakeConstraints:^(MASConstraintMaker *make) {
 
 }];
 //  这个方法将会覆盖以前的某些约束
 [blueView mas_updateConstraints:^(MASConstraintMaker *make) {
 
 }];
 */
@end
