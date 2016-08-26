//
//  UIImage+Round.m
//  Round
//
//  Created by hzf on 16/8/23.
//  Copyright © 2016年 hzf. All rights reserved.
//

#import "UIImage+Round.h"

@implementation UIImage (Round)

+ (id)createRoundedRectImage:(UIImage*)image size:(CGSize)size radius:(NSInteger)r {
    
    CGFloat width = size.width;
    CGFloat height = size.height;
    
    UIImage *img = image;
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
   
    CGRect rect = CGRectMake(0, 0, width, height);
    CGContextAddPath(context, [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:r].CGPath);
    CGContextClip(context);
   
    [img drawInRect:rect];
    CGContextDrawPath(context, kCGPathFillStroke);
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}



@end
