//
//  LLShareViewController.m
//  LLLottery
//
//  Created by 李学林 on 16/2/1.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLShareViewController.h"
#import <MessageUI/MessageUI.h>

@interface LLShareViewController ()<MFMessageComposeViewControllerDelegate>

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
    item2.option = ^{
        
//        NSString *shareNum = @"sms://10010";
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:shareNum]];
        // 以上方法有一个弊端,就是无法回退到应用程序内,因此一般不用上面方法!!!!!!!!!!
        
        // 开发中,一般用下面的方法
        // 0.判断设备能不能发短信,不能就不用往下走了!
        if (![MFMessageComposeViewController canSendText]) {
            return ;
        }
        // 1.创建控制器
        MFMessageComposeViewController *vc = [[MFMessageComposeViewController alloc]init];
        // 2.设置短信内容
        vc.body = @"吃饭了没?";
        // 3.设置收件人列表
        vc.recipients = @[@"10010",@"12306"];
        // 4.设置代理
        vc.messageComposeDelegate = self;
        // 5.显示控制器
        [self presentViewController:vc animated:YES completion:nil];
        
    };
    LLSettingItem *item3 = [LLSettingItem initWithImage:[UIImage imageNamed:@"MailShare"] title:@"邮件分享"];
    /**
     *  邮件分享跟短信分享差不多都是用这个库....不写了
     */
    [self.datas addObject:@[item1,item2,item3]];
}

#pragma mark -Delegate-MFMessageComposeViewControllerDelegate
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    
    switch (result) {
        case MessageComposeResultCancelled://MessageComposeResultCancelled,
            //
            NSLog(@"取消");
            [controller dismissViewControllerAnimated:YES completion:nil];
            break;
        case MessageComposeResultSent://MessageComposeResultCancelled,
            //
            NSLog(@"完成");
            break;
        case MessageComposeResultFailed://MessageComposeResultCancelled,
            //
            NSLog(@"发送失败");
            break;
        default:
            break;
    }
}
@end
