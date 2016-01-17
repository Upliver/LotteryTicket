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
    
}


@end
