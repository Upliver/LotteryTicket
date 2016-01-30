//
//  LLSettingItem.m
//  LLLottery
//
//  Created by 李学林 on 16/1/29.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLSettingItem.h"

@implementation LLSettingItem

- (void)show
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"没有新的版本可以更新" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}

+ (instancetype)initWithImage:(UIImage *)image title:(NSString *)title
{
    LLSettingItem *item = [[LLSettingItem alloc]init];
    item.title = title;
    item.image = image;
    return item;
}

@end
