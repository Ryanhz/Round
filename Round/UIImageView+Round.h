//
//  UIImageView+Cache.h
//  Round
//
//  Created by hzf on 16/8/23.
//  Copyright © 2016年 hzf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDImageCache.h"

@interface UIImageView (Round)

- (void)FE_loadImageURLStr:(NSString *)urlStr placeHolderImageName:(NSString *)placeHolderStr radius:(CGFloat)radius;

@end

