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

}
// 重写父类的push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 注意:如果是栈底控制器,就不要隐藏
    NSLog(@"%tu",self.viewControllers.count);
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    // 给每一个子控制器左侧添加一个自定义按钮
    viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:nil normalImage:@"NavBack" highlightedImage:nil target:self action:@selector(pop)];
    
    [super pushViewController:viewController animated:animated];
    
}

#pragma mark -子控制器导航栏左侧的点击事件
- (void)pop
{
    [self popViewControllerAnimated:YES];
}

@end
