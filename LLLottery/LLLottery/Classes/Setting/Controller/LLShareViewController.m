//
//  LLShareViewController.m
//  LLLottery
//
//  Created by 李学林 on 16/2/1.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLShareViewController.h"

@interface LLShareViewController ()

@end

@implementation LLShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addGroup];
    
}

- (void)addGroup
{
    LLSettingItem *item1 = [LLSettingItem initWithImage:[UIImage imageNamed:@"WeiboSina"] title:@"新浪微博"];
    LLSettingItem *item2 = [LLSettingItem initWithImage:[UIImage imageNamed:@"SmsShare"] title:@"短信分享"];
    LLSettingItem *item3 = [LLSettingItem initWithImage:[UIImage imageNamed:@"MailShare"] title:@"邮件分享"];

    [self.datas addObject:@[item1,item2,item3]];
}

@end
