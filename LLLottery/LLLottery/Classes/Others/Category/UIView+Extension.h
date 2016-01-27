//
//  UIView+Extension.h
//  LLLottery
//
//  Created by 李学林 on 16/1/27.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
/**
 *  自动在.m 生成一个私有的属性,以及会生成x的set和get方法的声明和实现
 *  但是需要注意的是:在分类中@property只能生成set和get方法的声明.并不会生成实现部分
 */
@property(nonatomic, assign) CGFloat x;

@end
