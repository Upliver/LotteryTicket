//
//  LLNavigationController.m
//  LLLottery
//
//  Created by 李学林 on 16/1/18.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLNavigationController.h"

@interface LLNavigationController ()

@end

@implementation LLNavigationController

+ (void)load{

}

+ (void)initialize
{
    // 通过外观对象设置导航栏的背景颜色
    // appearance方法,会设置所有导航条的外观,不管是不是当前的导航控制器
    // UINavigationBar *navBar = [UINavigationBar appearance];
    // appearanceWhenContainedIn:方法,会设置指定类的导航条的外观
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    // 设置导航栏的标题颜色
    NSMutableDictionary *md = [NSMutableDictionary dictionary];
    md[NSForegroundColorAttributeName] = [UIColor whiteColor];
    md[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    [navBar setTitleTextAttributes:md];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    // 设置导航栏的背景图片
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
     */
    /*
    // 通过外观对象设置导航栏的背景颜色
    // appearance方法,会设置所有导航条的外观,不管是不是当前的导航控制器
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    // 设置导航栏的标题颜色
    NSMutableDictionary *md = [NSMutableDictionary dictionary];
    md[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [self.navigationBar setTitleTextAttributes:md];
     */
}

// 调试用的
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
}

@end
