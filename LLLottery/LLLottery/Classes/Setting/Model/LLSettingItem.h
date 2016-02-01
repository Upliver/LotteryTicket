//
//  LLSettingItem.h
//  LLLottery
//
//  Created by 李学林 on 16/1/29.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef enum {
//
//    LLSettingTypeAlert = 99,
//    LLSettingTypePush
//
//} LLSettingType;

//typedef enum
//{
//    LLCellAccessoryViewTypeArrow = 99,
//    LLCellAccessoryViewTypeSwitch,
//    LLCellAccessoryViewTypeLabel
//
//} LLCellAccessoryViewType;

typedef void(^myOption)();

@interface LLSettingItem : NSObject
/**
 *  图标
 */
@property(nonatomic, strong) UIImage *image;
/**
 *  cell文字
 */
@property(nonatomic, copy) NSString *title;
/**
 *  cell上子标题(保存电话那一部分文字)
 */
@property(nonatomic, copy) NSString *subTitle;

/**
 *  是否有弹窗
 */
//@property(nonatomic, assign) LLSettingType type;

/**
 *  定义一个名字为option的block变量,用于保存将来要执行的代码
 */
//@property(nonatomic, copy) void (^option)();
// 或者用下面的方式代替上面的方式,代码的可读性就会加强
@property(nonatomic, copy) myOption option;

/**
 *  block 属性要用copy修饰  为什么? 
 *  — 因为block只是用于保存代码,只有在调用才会执行保存的代码,但是有时有可能在调用block时,block中用到的其他的对象已经释放了,为了避免这个情况,我们一般blcok用copy修饰(本来block是存储在栈区中,copy操作会迁移到堆区中,而堆区的对象是需要我们程序员自己管理的),这样能够保证,在调用block时候,block中用到的外界对象不会被释放!
 */

/**
 *  为什么不用方法封装将来要执行的代码?
 *  1. 有很多个cell每个cell的点击需要执行的代码不一样,如果写死,将来需求变了会很麻烦
 *  2. 有很多个cell,点击每一行要执行的操作应该由使用者决定.
 */
//- (void)show;

/*
//记录当前cell的右边的辅助图标的样式
@property(nonatomic, assign) LLCellAccessoryViewType accessoryViewType;
//记录当前开关的状态
@property(nonatomic, assign) BOOL open;
记录cell右侧视图中label中显示的内容

@property(nonatomic, copy) NSString *labelInfo;
*/

+ (instancetype)initWithImage:(UIImage *)image title:(NSString *)title;

@end
