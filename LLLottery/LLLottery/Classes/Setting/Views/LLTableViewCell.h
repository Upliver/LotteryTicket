//
//  LLTableViewCell.h
//  LLLottery
//
//  Created by 李学林 on 16/1/30.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLSettingItem.h"
#import "LLSettingItemArrow.h"
#import "LLSettingItemSwitch.h"
#import "LLSettingItemLabel.h"

@interface LLTableViewCell : UITableViewCell

// 1.提供一个快速常见cell的方法
+ (instancetype)cellWithTableView:(UITableView *)tableView;
// 2.接收外界传入的数据模型
@property(nonatomic, strong) LLSettingItem *item;

@end
