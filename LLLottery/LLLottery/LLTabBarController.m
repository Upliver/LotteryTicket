//
//  LLTabBarController.m
//  LLLottery
//
//  Created by 李学林 on 16/1/17.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLTabBarController.h"
#import "LLMineViewController.h"
#import "LLArenaViewController.h"
#import "LLDiscoverTableViewController.h"
#import "LLHallTableViewController.h"
#import "LLHistoryTableViewController.h"

@interface LLTabBarController ()

@end

@implementation LLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1.添加子控制器
    [self setUpChildVc];
}

- (void)setUpChildVc
{
    // 3. 创建子控制器
    LLHallTableViewController *hallVc = (LLHallTableViewController *)[self addChildWithName:@"LLHallTableViewController" andTitle:@"购彩大厅"];
    LLArenaViewController *arenaVc = (LLArenaViewController *)[self addChildWithName:@"LLArenaViewController" andTitle:@"竞技场"];
    LLDiscoverTableViewController *discoverVc = (LLDiscoverTableViewController *)[self addChildWithName:@"LLDiscoverTableViewController" andTitle:@"发现"];
    LLHistoryTableViewController *historyVc = (LLHistoryTableViewController *)[self addChildWithName:@"LLHistoryTableViewController" andTitle:@"开奖信息"];
    LLMineViewController *mineVc = (LLMineViewController *)[self addChildWithName:@"LLMineViewController" andTitle:@"我的彩票"];
    
    self.viewControllers = @[hallVc,arenaVc,discoverVc,historyVc,mineVc];


}

// 代码抽取
- (UIViewController *)addChildWithName:(NSString *)vcName andTitle:(NSString *)title
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:vcName bundle:nil];
    UIViewController *vc = sb.instantiateInitialViewController;
    vc.tabBarItem.title = title;
    return vc;
}

@end
