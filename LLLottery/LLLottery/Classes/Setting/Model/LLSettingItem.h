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

- (void)show;
@end
