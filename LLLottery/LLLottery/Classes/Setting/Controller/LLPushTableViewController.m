//
//  LLSettingTableViewController.m
//  LLLottery
//
//  Created by 李学林 on 16/1/29.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLPushTableViewController.h"
#import "LLSettingItem.h"
#import "LLTableViewCell.h"

@interface LLPushTableViewController ()

@end

@implementation LLPushTableViewController


- (void)addGroup0
{
    LLSettingItem *item1 = [LLSettingItemArrow initWithImage:[UIImage imageNamed:nil] title:@"开奖推送"];
    LLSettingItem *item2 = [LLSettingItemArrow initWithImage:[UIImage imageNamed:nil] title:@"比分直播推送"];
    LLSettingItem *item3 = [LLSettingItemArrow initWithImage:[UIImage imageNamed:nil] title:@"中奖动画"];
    LLSettingItem *item4 = [LLSettingItemArrow initWithImage:[UIImage imageNamed:nil] title:@"购彩提醒"];
    
    [self.datas addObject:@[item1,item2,item3,item4]];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加数据
    [self addGroup0];
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
    
    // 1.取出对应的组
    NSArray *group = self.datas[indexPath.section];
    // 2.取出对应的行
    LLSettingItem *item = group[indexPath.row];
    
    if (item.option != nil) {
        item.option();
    }
}


@end
