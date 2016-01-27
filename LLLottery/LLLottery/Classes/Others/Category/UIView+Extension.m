//
//  UIView+Extension.m
//  LLLottery
//
//  Created by 李学林 on 16/1/27.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setX:(CGFloat)x
{
    CGRect tempFrame = self.frame;
    tempFrame.origin.x = x;
    self.frame = tempFrame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}
@end
