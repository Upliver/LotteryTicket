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
#import "LLTabBar.h"
#import "LLNavigationController.h"


@interface LLTabBarController ()<LLTabBarDelegate>

@property(nonatomic, weak) LLTabBar *customTabBar;

@end

@implementation LLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 2.添加自定义TabBar
    [self setUpTabBar];
    
    // 1.添加子控制器
    [self setUpChildVc];
    
}

- (void)setUpTabBar{
    
    // 1.创建自定义TabBar
    LLTabBar *customTabBar = [[LLTabBar alloc]init];
    customTabBar.frame = self.tabBar.frame;
    [self.view addSubview:customTabBar];
    customTabBar.delegate = self;
    self.customTabBar = customTabBar;
    
    [self.tabBar removeFromSuperview];
}

- (void)setUpChildVc
{
    // 3. 创建子控制器
//    LLHallTableViewController *hallVc = (LLHallTableViewController *)
    [self addChildWithName:@"LLHallTableViewController" andTitle:@"购彩大厅" image:@"TabBar_LotteryHall" selectedImage:@"TabBar_LotteryHall_selected"];
//    LLArenaViewController *arenaVc = (LLArenaViewController *)
    [self addChildWithName:@"LLArenaViewController" andTitle:@"竞技场" image:@"TabBar_Arena" selectedImage:@"TabBar_Arena_selected"];
//    LLDiscoverTableViewController *discoverVc = (LLDiscoverTableViewController *)
    [self addChildWithName:@"LLDiscoverTableViewController" andTitle:@"发现" image:@"TabBar_Discovery" selectedImage:@"TabBar_Discovery_selected"];
//    LLHistoryTableViewController *historyVc = (LLHistoryTableViewController *)
    [self addChildWithName:@"LLHistoryTableViewController" andTitle:@"开奖信息" image:@"TabBar_History" selectedImage:@"TabBar_History_selected"];
//    LLMineViewController *mineVc = (LLMineViewController *)
    [self addChildWithName:@"LLMineViewController" andTitle:@"我的彩票" image:@"TabBar_MyLottery" selectedImage:@"TabBar_MyLottery_selected"];
    
//    self.viewControllers = @[hallVc,arenaVc,discoverVc,historyVc,mineVc];

}

// 代码抽取
- (void)addChildWithName:(NSString *)vcName andTitle:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:vcName bundle:nil];
    UIViewController *vc = sb.instantiateInitialViewController;
    
    // vc.tabBarItem.title = title;
    // vc.navigationItem.title = title;
    // 上面两句话可以用下面一句话代替
    vc.title = title;
    
    UIImage *nor = [UIImage imageNamed:image];
    
    // 设置图片的渲染模式----另外也可直接在Assets文件中选中图片设置Render属性为Original就OK了
    nor = [nor imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.image = nor;
    
    UIImage *selected = [UIImage imageNamed:selectedImage];
    selected = [selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = selected;
    
    // 调用自定义TabBar创建按钮的方法
    [self.customTabBar addTabBarButtonWith:vc.tabBarItem];
    
    // 给每一个控制器包装一个导航控制器
    UINavigationController *nav = [[LLNavigationController alloc]initWithRootViewController:vc];
    
    if ([vc isKindOfClass:[LLArenaViewController class]]) {
        nav = [[UINavigationController alloc]initWithRootViewController:vc];
    }
    
    // 添加到tabBarControllers中
    [self addChildViewController:nav];

}

#pragma mark -LLTabBarDelegate
- (void)tabBar:(LLTabBar *)tabBar didSelectButtonFrom:(NSInteger)from to:(NSInteger)to
{
    NSLog(@"%tu---%tu",from,to);
    
    // 切换控制器
    // 方式一
//    UIViewController *vc = self.viewControllers[to];
//    self.selectedViewController = vc;
    // 方式二
     self.selectedIndex = to;
}
@end
