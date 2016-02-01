//
//  LLSettingTableViewController.m
//  LLLottery
//
//  Created by 李学林 on 16/1/29.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLBaseTableViewController.h"
#import "LLSettingItem.h"
#import "LLTableViewCell.h"
#import "LLPushTableViewController.h"



@interface LLBaseTableViewController ()

@end

@implementation LLBaseTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    return self;
}
// 重写init方法
- (instancetype)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    return self;
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
    NSArray *group = _datas[indexPath.section];
    // 2.2.取出对应的行
    LLSettingItem *item = group[indexPath.row];
    cell.item = item;
    // 3.返回cell
    return cell;
}


// 选中某一行的时候调用这个方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *group = _datas[indexPath.section];
    // 2.取出对应的行
    LLSettingItem *item = group[indexPath.row];
    if (item.option != nil) {
        item.option();
    }
}

#pragma mark -懒加载datas
- (NSArray *)datas
{
    if (!_datas) {
        
        // 1.创建数组
        _datas = [NSMutableArray array];
        // 2.添加每一组数据
        
    }
    return _datas;
}


@end
