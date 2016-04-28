//
//  ViewController.m
//  05-Autolayout
//
//  Created by yhp on 16/3/3.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *spacingContraint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    self.label.text = @"ahhjhajhcihdjshjdskjdk9999ds8u8u8sufisfsdhfjjskdkkfhdsyfgyegfeeiioidoejdijsdhshdjs888hh8j";
//    忘掉frame，拥抱AutoLayout
//    CGRect frame = self.blueView.frame;
//    frame.origin.y += 50;
//    self.blueView.frame = frame;
    self.spacingContraint.constant = 50;
    
    [UIView animateWithDuration:2.0 animations:^{
        [self.blueView layoutIfNeeded];
    }];
}
@end
