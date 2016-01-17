//
//  UIBarButtonItem+Extension.m
//  LLLottery
//
//  Created by 李学林 on 16/1/18.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title normalImage:(NSString *)image highlightedImage:(NSString *)hightedImage target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    // 错误信息:CUICatalog: Invalid asset name supplied: (null)
    // 当上面传递图像是空时候会报上面的错误
    if (image != nil && ![image isEqualToString:@""]) {
        [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    if (hightedImage != nil && ![hightedImage isEqualToString:@""]) {
        
        [btn setImage:[UIImage imageNamed:hightedImage] forState:UIControlStateHighlighted];
    }
    if (title != nil && ![title isEqualToString:@""]) {
        
        [btn setTitle:title forState:UIControlStateNormal];
    }
    [btn sizeToFit];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 返回一个UIBarButtonItem
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}



@end
