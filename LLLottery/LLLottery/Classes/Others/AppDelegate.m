//
//  AppDelegate.m
//  LLLottery
//
//  Created by LL on 16/1/17.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "AppDelegate.h"
#import "LLTabBarController.h"


@interface AppDelegate ()
// /Users/Upriver/Documents/LLLotteryTickt/LLLottery/LLLottery/AppDelegate.m:30:5: Unknown type name 'LLTabBarController'; did you mean 'UITabBarController'?
///Users/Upriver/Documents/LLLotteryTickt/LLLottery/LLLottery/AppDelegate.m:10:9: 'LLMineViewController.h' file not found
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // 1. 创建window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    // 2. 创建根控制器
    LLTabBarController *tabBarVc = [[LLTabBarController alloc]init];
    tabBarVc.view.backgroundColor = [UIColor redColor];
    self.window.rootViewController = tabBarVc;
    
    // 4. 显示window
    [self.window makeKeyAndVisible];
    return YES;
}

@end
