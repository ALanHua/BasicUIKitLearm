//
//  YHPDog.m
//  04-UIScrolView-代理
//
//  Created by yhp on 16/2/29.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "YHPDog.h"

@interface YHPDog() 

@end

@implementation YHPDog

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"Dog didScrolView");
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"textFieldShouldEndEditing");
    return YES;
}
@end
