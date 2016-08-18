//
//  HZHSDWebImage.m
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/17.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

#import "HZHSDWebImage.h"
#import "UIImageView+WebCache.h"
@implementation HZHSDWebImage


- (void)sdsetImageView:(UIImageView *)ImageView WithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder {
    [ImageView sd_setImageWithURL:url placeholderImage:placeholder options:0 progress:nil completed:nil];
}


@end
