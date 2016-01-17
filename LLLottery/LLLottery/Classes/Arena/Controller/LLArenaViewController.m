//
//  LLArenaViewController.m
//  LLLottery
//
//  Created by 李学林 on 16/1/17.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLArenaViewController.h"

@interface LLArenaViewController ()

@end

@implementation LLArenaViewController

// 控制器的View被使用到的时候会调用这个方法
- (void)loadView
{
    UIImageView *iv = [[UIImageView alloc]init];
    iv.image = [UIImage imageNamed:@"NLArenaBackground"];
    self.view = iv;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.设置导航栏的背景
       // 设置图片的拉伸
        //方式一
    UIImage *image = [UIImage imageNamed:@"NLArenaNavBar64"];
//    CGSize size = image.size;
//    image = [image stretchableImageWithLeftCapWidth:size.width * 0.5 topCapHeight:size.height * 0.5];
        //方式二
        //UIEdgeInsetsMake(10, 10, 10, 10) 方法的意思是距离上左下右多少不拉伸
//    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(size.height * 0.5, size.width * 0.5, size.height * 0.5, size.width * 0.5)];
        //方式三
        // 较之以上面的方法多了一个拉伸模式   平铺/拉伸
//    image = [image resizableImageWithCapInsets:<#(UIEdgeInsets)#> resizingMode:<#(UIImageResizingMode)#>]
        // 方式四 直接对图片进行操作
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    // 创建UISegmentControl
    NSArray *items = @[@"足球",@"篮球"];
    UISegmentedControl *control = [[UISegmentedControl alloc]initWithItems:items];
    // 注意:设置navigationItem.titleView的frame时候x,y 是不起作用的
    self.navigationItem.titleView = control;
    
    control.frame = CGRectMake(10000, 10000, 150, 30);
    // 设置control背景图片
    [control setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [control setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    // 设置按钮的渲染颜色
    [control setTintColor:[UIColor colorWithRed:18/255.0 green:141/255.0 blue:141/255.0 alpha:1]];
    // 设置按钮的选中颜色
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [control setTitleTextAttributes:dict forState:UIControlStateSelected];
    
    // 设置默认选中第一个
    [control setSelectedSegmentIndex:0];
}


@end
