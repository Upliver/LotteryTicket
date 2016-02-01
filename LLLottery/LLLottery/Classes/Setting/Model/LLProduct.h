//
//  LLProduct.h
//  LLLottery
//
//  Created by 李学林 on 16/2/2.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLProduct : NSObject
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *icon;
@property(nonatomic, copy) NSString *scheme;
@property(nonatomic, copy) NSString *url;
@property(nonatomic, copy) NSString *identifier;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)productWithDict:(NSDictionary *)dict;
@end
