//
//  AppDelegate.m
//  LLLottery
//
//  Created by LL on 16/1/17.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "AppDelegate.h"
#import "LLTabBarController.h"
#import "LLNewfeatureCollectionViewController.h"


@interface AppDelegate ()
// /Users/Upriver/Documents/LLLotteryTickt/LLLottery/LLLottery/AppDelegate.m:30:5: Unknown type name 'LLTabBarController'; did you mean 'UITabBarController'?
///Users/Upriver/Documents/LLLotteryTickt/LLLottery/LLLottery/AppDelegate.m:10:9: 'LLMineViewController.h' file not found
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // 1. 创建window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    
    
    
    // 3. 获取软件自身的软件版本号
    NSDictionary *dict = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = dict[@"CFBundleShortVersionString"];
    NSLog(@"%@",currentVersion);
    // 4. 获取本地存储的版本号
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *sandBoxVersion = [defaults objectForKey:@"abc"];
    NSLog(@"sandBoxVersion == %@",sandBoxVersion);
    // 5. 对比两个版本号
    // 6. 如果自身>本地-->显示新特性
//    if ([currentVersion compare:sandBoxVersion] == NSOrderedDescending) {
//        [defaults setValue:currentVersion forKey:@"abc"];
//        [defaults synchronize];
        // 显示新特性
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = [UIScreen mainScreen].bounds.size;
        LLNewfeatureCollectionViewController *vc = [[LLNewfeatureCollectionViewController alloc]initWithCollectionViewLayout:layout];
        vc.view.backgroundColor  = [UIColor purpleColor];
        self.window.rootViewController = vc;
        
//    }else{
//        // 如果软件自身版本号等于沙盒 直接进入首页
//        // 2. 创建根控制器
//        LLTabBarController *tabBarVc = [[LLTabBarController alloc]init];
//        tabBarVc.view.backgroundColor = [UIColor redColor];
//         self.window.rootViewController = tabBarVc;
//    }
    
    // 4. 显示window
    [self.window makeKeyAndVisible];
    return YES;
}

@end
