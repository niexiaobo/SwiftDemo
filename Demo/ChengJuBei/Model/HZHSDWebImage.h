//
//  HZHSDWebImage.h
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/17.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HZHSDWebImage : NSObject

- (void)sdsetImageView:(UIImageView *)ImageView WithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;
@end
