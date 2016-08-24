//
//  UIImageView+Cache.m
//  Round
//
//  Created by hzf on 16/8/23.
//  Copyright © 2016年 hzf. All rights reserved.
//

#import "UIImageView+Cache.h"
#import "UIImageView+WebCache.h"
#import "UIImage+Round.h"

static NSString *DSRoundImagePreString = @"sssssssss";

@implementation UIImageView (Cache)


- (void)setIsRound:(BOOL)isRound withSize:(CGSize)size {
    
    [[SDWebImageManager sharedManager] setCacheKeyFilter:^(NSURL *url) {
        
        if (isRound) {
            NSString *urlStr = [NSString stringWithFormat:@"%@%f%f%@%@",DSRoundImagePreString, size.width, size.height,DSRoundImagePreString, [url absoluteString]];
            return urlStr;
        }
        
        return [url  absoluteString];
    }];
    
}

- (void)FE_loadImageURLStr:(NSString *)urlStr placeHolderImageName:(NSString *)placeHolderStr radius:(CGFloat)radius {
    
    NSURL *url;
    
    if (placeHolderStr == nil) {
        placeHolderStr = @"";
    }
    
    url = [NSURL URLWithString:urlStr];
    
    if (radius != 0.0) {
        NSString *cacheUrlStr = [urlStr stringByAppendingString:@"radiusCache"];
        UIImage *cacheImage = [[SDImageCache sharedImageCache]imageFromDiskCacheForKey:cacheUrlStr];
        if (cacheImage) {
            self.image = cacheImage;
        } else {
            [self sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:placeHolderStr] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
               
                UIImage *radiusImage = [UIImage createRoundedRectImage:image size:self.frame.size radius:radius];
                self.image = radiusImage;
                [[SDImageCache sharedImageCache] storeImage:radiusImage forKey:cacheUrlStr];
                [[SDImageCache sharedImageCache] removeImageForKey:urlStr];
                
            }];
        }
    } else {
        [self sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:placeHolderStr]];
    }
}

@end
