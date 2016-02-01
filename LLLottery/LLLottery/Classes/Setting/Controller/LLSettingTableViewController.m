//
//  LLSettingTableViewController.m
//  LLLottery
//
//  Created by 李学林 on 16/1/29.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLSettingTableViewController.h"
#import "LLSettingItem.h"
#import "LLTableViewCell.h"
#import "LLPushTableViewController.h"
#import "LLShareViewController.h"


//typedef enum {
//    
//    LLSettingTypeAlert,
//    LLSettingTypePush
//    
//} LLSettingType;

//#define LLSettingTypeAlert @"alert"
//#define LLSettingTypePush @"push"

@interface LLSettingTableViewController ()


@end

@implementation LLSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    
    [self addGroup0];
    [self addGroup1];
    [self addGroup2];
}

- (void)addGroup0
{
    LLSettingItem *redeemCode = [LLSettingItemArrow initWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    
    [self.datas addObject:@[redeemCode]];
}
- (void)addGroup1
{
    LLSettingItem *morePush = [LLSettingItemArrow initWithImage:[UIImage imageNamed:@"MorePush"] title:@"推送和提醒"];
    
    morePush.option = ^{
        LLPushTableViewController *pushVc = [[LLPushTableViewController alloc]init];
#warning ------待修改
        pushVc.title = morePush.title;
        [self.navigationController pushViewController:pushVc animated:YES];
    };
    
    LLSettingItemSwitch *more_homeshake = [LLSettingItemSwitch initWithImage:[UIImage imageNamed:@"more_homeshake"] title:@"摇一摇机选"];
    more_homeshake.open = YES;
    
    
    LLSettingItem *sound_Effect = [LLSettingItemSwitch initWithImage:[UIImage imageNamed:@"sound_Effect"] title:@"声音效果"];
    
    LLSettingItem *More_LotteryRecommend = [LLSettingItemSwitch initWithImage:[UIImage imageNamed:@"More_LotteryRecommend"] title:@"购彩小助手"];
    
    [self.datas addObject:@[morePush,more_homeshake,sound_Effect,More_LotteryRecommend]];
}
- (void)addGroup2
{
    LLSettingItem *redeemCode = [LLSettingItemArrow initWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    LLSettingItem *MoreShare = [LLSettingItem initWithImage:[UIImage imageNamed:@"MoreShare"] title:@"分享"];
    MoreShare.option = ^{
        
        LLShareViewController *shareVc = [[LLShareViewController alloc]init];
        shareVc.title = MoreShare.title;
        [self.navigationController pushViewController:shareVc animated:YES];
    };
    LLSettingItem *MoreNetease = [LLSettingItemArrow initWithImage:[UIImage imageNamed:@"MoreNetease"] title:@"产品推荐"];
    LLSettingItem *MoreAbout = [LLSettingItemArrow initWithImage:[UIImage imageNamed:@"MoreAbout"] title:@"关于"];
    [self.datas addObject:@[redeemCode,MoreShare,MoreNetease,MoreAbout]];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    NSLog(@"%tu",self.datas.count);
    return self.datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // 1.取出对应的租
    NSArray *group = self.datas[section];
    // 2.返回对应租的个数
    return group.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    // 1.创建cell
    LLTableViewCell *cell = [LLTableViewCell cellWithTableView:tableView];
    // 2.传递当前行对应的数据模型
        // 2.1.取出对应的组
    NSArray *group = self.datas[indexPath.section];
        // 2.2.取出对应的行
    LLSettingItem *item = group[indexPath.row];
    cell.item = item;
    // 3.返回cell
    return cell;
}


// 选中某一行的时候调用这个方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *group = self.datas[indexPath.section];
    // 2.取出对应的行
    LLSettingItem *item = group[indexPath.row];
        if (item.option != nil) {
        item.option();
    }
}


@end
