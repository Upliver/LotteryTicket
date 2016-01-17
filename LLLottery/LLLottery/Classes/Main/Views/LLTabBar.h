//
//  LLTabBar.h
//  LLLottery
//
//  Created by 李学林 on 16/1/17.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LLTabBar;
@protocol LLTabBarDelegate <NSObject>

- (void)tabBar:(LLTabBar *)tabBar didSelectButtonFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface LLTabBar : UIView

@property(nonatomic, weak) id<LLTabBarDelegate> delegate;

/**
 *  给外界提供一个创建按钮的方法
 *
 *  @param item 按钮需要上显示的数据,由用户设置(模仿系统)
 */
- (void)addTabBarButtonWith:(UITabBarItem *)item;
@end
