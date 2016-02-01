
//
//  LLProduct.m
//  LLLottery
//
//  Created by 李学林 on 16/2/2.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLProduct.h"

@implementation LLProduct

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        self.icon = dict[@"icon"];
        self.title = dict[@"title"];
        self.url = dict[@"url"];
        self.scheme = dict[@"customUrl"];
        self.identifier = dict[@"id"];
    }
    return self;
}
+ (instancetype)productWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

@end
