
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
    item1.option = ^{
        NSString *appid = @"xxxx";//每一个上架的app都有一个appid
        NSString *urlStr = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/id%@?mt=8",apppid];
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:urlStr]];
    };
    LLSettingItem *item2 = [LLSettingItemArrow initWithImage:nil title:@"热线电话"];
    
    item2.option = ^{
        //拨打电话
        NSString *teleNum1 = @"tel://18519330596";// 直接出现打电话界面
        //NSString *teleNum2 = @"telprompt://18519330596";// 会有一个提示是否拨打这个号码!
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:teleNum1]];
    };
    item2.subTitle = @"010-12345678";
    [self.datas addObject:@[item1,item2]];

}


@end
