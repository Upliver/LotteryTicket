//
//  LLHallTableViewController.m
//  LLLottery
//
//  Created by 李学林 on 16/1/17.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLHallTableViewController.h"

@interface LLHallTableViewController ()

@end

@implementation LLHallTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    // 1.设置左边按钮--下面方法的局限性仅仅能设置一张图片--满足不了需求
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"CS50_activity_image"] style:UIBarButtonItemStylePlain target:self action:@selector(activity)];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"CS50_activity_image"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"NavInfoFlat"] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:self action:@selector(activity) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
     */
    self.navigationItem.leftBarButtonItem = [self itemWithTitle:nil normalImage:@"CS50_activity_image" highlightedImage:nil];
}

- (UIBarButtonItem *)itemWithTitle:(NSString *)title normalImage:(NSString *)image highlightedImage:(NSString *)hightedImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    // 错误信息:CUICatalog: Invalid asset name supplied: (null)
    // 当上面传递图像是空时候会报上面的错误
    if (image != nil && ![image isEqualToString:@""]) {
        [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    if (hightedImage != nil && ![hightedImage isEqualToString:@""]) {

        [btn setImage:[UIImage imageNamed:hightedImage] forState:UIControlStateHighlighted];
    }
    if (title != nil && ![title isEqualToString:@""]) {
        
        [btn setTitle:title forState:UIControlStateNormal];
    }
    [btn sizeToFit];
    [btn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    // 返回一个UIBarButtonItem
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

- (void)clickItem:(UIBarButtonItem *)item{

}

- (void)activity
{
    NSLog(@"%s",__func__);
}
@end
