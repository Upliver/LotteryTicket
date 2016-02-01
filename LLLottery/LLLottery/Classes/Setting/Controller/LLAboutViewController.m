
//
//  LLAboutViewController.m
//  LLLottery
//
//  Created by 李学林 on 16/2/2.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLAboutViewController.h"

@interface LLAboutViewController ()

@end

@implementation LLAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addGroup];
    
    // 添加顶部视图
    UIView *headerView = [[[NSBundle mainBundle]loadNibNamed:@"LLAboutHeaderView" owner:nil options:nil] lastObject];
    
    self.tableView.tableHeaderView = headerView;
}

- (void)addGroup
{
    LLSettingItem *item1 = [LLSettingItemArrow initWithImage:nil title:@"评分支持"];
    LLSettingItem *item2 = [LLSettingItemArrow initWithImage:nil title:@"热线电话"];
    item2.subTitle = @"010-12345678";
    [self.datas addObject:@[item1,item2]];

}


@end
