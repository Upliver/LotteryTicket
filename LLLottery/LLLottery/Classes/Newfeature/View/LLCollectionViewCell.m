//
//  LLCollectionViewCell.m
//  LLLottery
//
//  Created by 李学林 on 16/1/28.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLCollectionViewCell.h"
#import "LLTabBarController.h"

@interface LLCollectionViewCell ()
@property(nonatomic, weak)IBOutlet UIImageView *bg;
@property(nonatomic, weak)IBOutlet UIImageView *guide;
@property(nonatomic, weak)IBOutlet UIImageView *guideLargeText;
@property(nonatomic, weak)IBOutlet UIImageView *guideSmallText;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;

- (IBAction)startBtnClick:(UIButton *)sender;
@end

@implementation LLCollectionViewCell

- (void)setIndexPath:(NSIndexPath *)indexPath count:(NSInteger)count
{
    // 根据传入的indexpath, 设置对应的图片名称
    NSString *bgImage = [NSString stringWithFormat:@"guide%ldBackground",indexPath.item + 1];
    NSString *guideName = [NSString stringWithFormat:@"guide%tu",indexPath.item + 1];
    NSString *guideLargeTextName = [NSString stringWithFormat:@"guideLargeText%tu",indexPath.item + 1];
    NSString *guideSmallTextName = [NSString stringWithFormat:@"guideSmallText%tu",indexPath.item + 1];
    // 设置图片
    self.bg.image = [UIImage imageNamed:bgImage];
    self.guide.image = [UIImage imageNamed:guideName];
    self.guideLargeText.image = [UIImage imageNamed:guideLargeTextName];
    self.guideSmallText.image = [UIImage imageNamed:guideSmallTextName];
    
    // 控制开始按钮的显示
    if (indexPath.item == count - 1) {
        self.startBtn.hidden = NO;
    }else{
        self.startBtn.hidden = YES;
    }
}

- (IBAction)startBtnClick:(UIButton *)sender {
    // 1.拿到window
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    // 2.创建首页控制器
    LLTabBarController *tabBarVc = [[LLTabBarController alloc]init];
    // 3.设置window的根控制器
    window.rootViewController = tabBarVc;
}
@end
