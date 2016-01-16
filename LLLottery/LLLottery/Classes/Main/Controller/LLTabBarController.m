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
#import "LLTabBarButton.h"

@interface LLTabBarController ()
/**
 *  当前选中的按钮
 */
@property(nonatomic, weak) UIButton *currentSelButton;

@end

@implementation LLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1.添加子控制器
    [self setUpChildVc];
    
    // 2.添加自定义TabBar
    [self setUpTabBar];
}

- (void)setUpTabBar{
    
    // 1.创建自定义TabBar
    LLTabBar *customTabBar = [[LLTabBar alloc]init];
    customTabBar.frame = self.tabBar.frame;
    customTabBar.backgroundColor = [UIColor blueColor];
    [self.view addSubview:customTabBar];
    /*
    // 2.添加五个按钮
    for (int i = 0; i < 5; i++) {
        
        LLTabBarButton *button = [LLTabBarButton buttonWithType:UIButtonTypeCustom];
        
        NSString *imageName = [NSString stringWithFormat:@"TabBar%d",i+1];
        NSString *seleImageName = [NSString stringWithFormat:@"TabBar%dSel",i+1];
        [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:seleImageName] forState:UIControlStateSelected];
        // 3.设置按钮的frame
        CGFloat buttonW = customTabBar.frame.size.width/5;
        CGFloat buttonH = customTabBar.frame.size.height;
        CGFloat buttonX = i * buttonW;
        CGFloat buttonY = 0;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        [customTabBar addSubview:button];
        
        // 4.监听按钮点击事件
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
        
        // 5.设置默认选中第一个按钮
        if (0 == i) {
            [self buttonClick:button];
        }
    }
    */
    
    [self.tabBar removeFromSuperview];
}
/*
- (void)buttonClick:(UIButton *)button{
    
    NSLog(@"%s",__func__);
    // 1.取消之前按钮的选中状态
    self.currentSelButton.selected = NO;
    // 2.设置当前按钮的选中状态
    button.selected = YES;
    // 3.记录当前按钮
    self.currentSelButton = button;
}
*/
- (void)setUpChildVc
{
    // 3. 创建子控制器
    LLHallTableViewController *hallVc = (LLHallTableViewController *)[self addChildWithName:@"LLHallTableViewController" andTitle:@"购彩大厅" image:@"TabBar_LotteryHall" selectedImage:@"TabBar_LotteryHall_selected"];
    LLArenaViewController *arenaVc = (LLArenaViewController *)[self addChildWithName:@"LLArenaViewController" andTitle:@"竞技场" image:@"TabBar_Arena" selectedImage:@"TabBar_Arena_selected"];
    LLDiscoverTableViewController *discoverVc = (LLDiscoverTableViewController *)[self addChildWithName:@"LLDiscoverTableViewController" andTitle:@"发现" image:@"TabBar_Discovery" selectedImage:@"TabBar_Discovery_selected"];
    LLHistoryTableViewController *historyVc = (LLHistoryTableViewController *)[self addChildWithName:@"LLHistoryTableViewController" andTitle:@"开奖信息" image:@"TabBar_History" selectedImage:@"TabBar_History_selected"];
    LLMineViewController *mineVc = (LLMineViewController *)[self addChildWithName:@"LLMineViewController" andTitle:@"我的彩票" image:@"TabBar_MyLottery" selectedImage:@"TabBar_MyLottery_selected"];
    
    self.viewControllers = @[hallVc,arenaVc,discoverVc,historyVc,mineVc];

}

// 代码抽取
- (UIViewController *)addChildWithName:(NSString *)vcName andTitle:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:vcName bundle:nil];
    UIViewController *vc = sb.instantiateInitialViewController;
    
    //vc.tabBarItem.title = title;
    UIImage *nor = [UIImage imageNamed:image];
    
    // 设置图片的渲染模式----另外也可直接在Assets文件中选中图片设置Render属性为Original就OK了
    nor = [nor imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.image = nor;
    
    UIImage *selected = [UIImage imageNamed:selectedImage];
    selected = [selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = selected;
    
    return vc;
}

@end
