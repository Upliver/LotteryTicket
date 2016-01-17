//
//  LLMineViewController.m
//  LLLottery
//
//  Created by 李学林 on 16/1/17.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLMineViewController.h"

@interface LLMineViewController ()

@end

@implementation LLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:@"客服" normalImage:@"" highlightedImage:nil target:nil action:nil];
    // 2.右边
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"设置" normalImage:nil highlightedImage:nil target:nil action:nil];
    
}

@end
