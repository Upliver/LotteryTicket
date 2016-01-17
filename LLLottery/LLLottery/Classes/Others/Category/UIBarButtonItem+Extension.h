//
//  UIBarButtonItem+Extension.h
//  LLLottery
//
//  Created by 李学林 on 16/1/18.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
/**
 *  快速创建item
 *
 *  @param title        标题
 *  @param image        默认显示的图片
 *  @param hightedImage 高亮状态显示的图
 *
 *  @return 返回一个UIBarButtonItem
 */
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title normalImage:(NSString *)image highlightedImage:(NSString *)hightedImage target:(id)target action:(SEL)action;

@end
