//
//  LLTabBar.m
//  LLLottery
//
//  Created by 李学林 on 16/1/17.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLTabBar.h"
#import "LLTabBarButton.h"

@interface LLTabBar()
/**
 *  当前选中的按钮
 */
@property(nonatomic, weak) UIButton *currentSelButton;
@end

@implementation LLTabBar

// 1.通过代码创建View会调用
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupButton];
    }
    return self;
}
// 2.通过文件创建View(xib/SB..)会调用
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupButton];
    }
    return self;
}

- (void)setupButton
{
    for (int i = 0; i < 5; i++) {
        
        LLTabBarButton *button = [LLTabBarButton buttonWithType:UIButtonTypeCustom];
        
        NSString *imageName = [NSString stringWithFormat:@"TabBar%d",i+1];
        NSString *seleImageName = [NSString stringWithFormat:@"TabBar%dSel",i+1];
        [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:seleImageName] forState:UIControlStateSelected];
        
        [self addSubview:button];
        
        // 4.监听按钮点击事件
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
        
        // 5.设置默认选中第一个按钮
        if (0 == i) {
            [self buttonClick:button];
        }
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    for (int i = 0; i < count; i++) {
        // 1.取出对应的button
        LLTabBarButton *button = self.subviews[i];
        // 3.设置按钮的frame
        CGFloat buttonW = self.frame.size.width/5;
        CGFloat buttonH = self.frame.size.height;
        CGFloat buttonX = i * buttonW;
        CGFloat buttonY = 0;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
    }
}

- (void)buttonClick:(UIButton *)button{
    
    NSLog(@"%s",__func__);
    // 1.取消之前按钮的选中状态
    self.currentSelButton.selected = NO;
    // 2.设置当前按钮的选中状态
    button.selected = YES;
    // 3.记录当前按钮
    self.currentSelButton = button;
}
@end
