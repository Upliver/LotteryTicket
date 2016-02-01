//
//  LLBaseTableViewController.h
//  LLLottery
//
//  Created by 李学林 on 16/2/1.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLSettingItem.h"
#import "LLSettingItemArrow.h"
#import "LLSettingItemSwitch.h"
#import "LLSettingItemLabel.h"

@interface LLBaseTableViewController : UITableViewController

@property(nonatomic, strong) NSMutableArray *datas;

@end
