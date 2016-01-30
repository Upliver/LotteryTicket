//
//  LLSettingItem.m
//  LLLottery
//
//  Created by 李学林 on 16/1/29.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLSettingItem.h"

@implementation LLSettingItem

+ (instancetype)initWithImage:(UIImage *)image title:(NSString *)title
{
    LLSettingItem *item = [[self alloc]init];
    item.title = title;
    item.image = image;
    return item;
}



@end
