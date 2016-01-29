//
//  LLSettingItem.h
//  LLLottery
//
//  Created by 李学林 on 16/1/29.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {

    LLSettingTypeAlert = 99,
    LLSettingTypePush

} LLSettingType;


@interface LLSettingItem : NSObject
/**
 *  cell头像
 */
@property(nonatomic, copy) NSString *icon;
/**
 *  cell文字
 */
@property(nonatomic, copy) NSString *title;
/**
 *  是否有弹窗
 */
@property(nonatomic, assign) LLSettingType type;


/**
 *  为什么不用方法封装将来要执行的代码?
 *  1. 有很多个cell每个cell的点击需要执行的代码不一样,如果写死,将来需求变了会很麻烦
 *  2. 有很多个cell,点击每一行要执行的操作应该由使用者决定.
 */
- (void)show;
@end
