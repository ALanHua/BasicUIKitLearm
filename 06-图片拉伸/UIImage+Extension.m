//
//  UIImage+Extension.m
//  06-图片拉伸
//
//  Created by yhp on 16/3/16.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (UIImage*)resizableImage:(NSString*)name
{
    UIImage* image = [self imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
@end
