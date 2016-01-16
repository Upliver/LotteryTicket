//
//  AppDelegate.m
//  LLLottery
//
//  Created by LL on 16/1/17.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "AppDelegate.h"
#import "LLMineViewController.h"
#import "LLArenaViewController.h"
#import "LLDiscoverTableViewController.h"
#import "LLHallTableViewController.h"
#import "LLHistoryTableViewController.h"
#import "LLTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /*
    // 1. 创建window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    // 2. 创建根控制器
    UITabBarController *tabBarVc = [[UITabBarController alloc]init];
    tabBarVc.view.backgroundColor = [UIColor redColor];
    self.window.rootViewController = tabBarVc;
    // 3. 创建自控制器
    // 3.1 购彩大厅
    LLHallTableViewController *hallVc = [[LLHallTableViewController alloc]init];
    hallVc.tabBarItem.title = @"购彩大厅";
    // 3.2 竞技场
    LLArenaViewController *arenaVc = [[LLArenaViewController alloc]init];
    arenaVc.tabBarItem.title = @"竞技场";
    // 3.3 发现
    LLDiscoverTableViewController *discoverVc = [[LLDiscoverTableViewController alloc]init];
    discoverVc.tabBarItem.title = @"发现";
    // 3.4 开奖信息
    LLHistoryTableViewController *historyVc = [[LLHistoryTableViewController alloc]init];
    historyVc.tabBarItem.title = @"开奖信息";
    // 3.5 我
    LLMineViewController *mineVc = [[LLMineViewController alloc]init];
    mineVc.tabBarItem.title = @"我的彩票";
    
    tabBarVc.viewControllers = @[hallVc,arenaVc,discoverVc,historyVc,mineVc];
    
    // 4. 显示window
    [self.window makeKeyAndVisible];
     */
    // 1. 创建window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    // 2. 创建根控制器
    // UITabBarController *tabBarVc = [[UITabBarController alloc]init];
    // 自定义tabBarVc
    LLTabBarController *tabBarVc = [[LLTabBarController alloc]init];
    tabBarVc.view.backgroundColor = [UIColor redColor];
    self.window.rootViewController = tabBarVc;
    
    /*
    // 3. 创建子控制器
    LLHallTableViewController *hallVc = (LLHallTableViewController *)[self addChildWithName:@"LLHallTableViewController" andTitle:@"购彩大厅"];
    LLArenaViewController *arenaVc = (LLArenaViewController *)[self addChildWithName:@"LLArenaViewController" andTitle:@"竞技场"];
    
    LLDiscoverTableViewController *discoverVc = (LLDiscoverTableViewController *)[self addChildWithName:@"LLDiscoverTableViewController" andTitle:@"发现"];
    LLHistoryTableViewController *historyVc = (LLHistoryTableViewController *)[self addChildWithName:@"LLHistoryTableViewController" andTitle:@"开奖信息"];
    LLMineViewController *mineVc = (LLMineViewController *)[self addChildWithName:@"LLMineViewController" andTitle:@"我的彩票"];
    
    tabBarVc.viewControllers = @[hallVc,arenaVc,discoverVc,historyVc,mineVc];
     */
    
    // 4. 显示window
    [self.window makeKeyAndVisible];
    return YES;
}
/*
// 代码抽取
- (UIViewController *)addChildWithName:(NSString *)vcName andTitle:(NSString *)title
{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:vcName bundle:nil];
    UIViewController *vc = sb.instantiateInitialViewController;
    vc.tabBarItem.title = title;
    return vc;
}
*/
@end
