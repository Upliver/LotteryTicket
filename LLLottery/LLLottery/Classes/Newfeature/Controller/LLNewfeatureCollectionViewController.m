//
//  LLNewfeatureCollectionViewController.m
//  LLLottery
//
//  Created by 李学林 on 16/1/23.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLNewfeatureCollectionViewController.h"
#import "LLCollectionViewCell.h"

@interface LLNewfeatureCollectionViewController ()

@property(nonatomic, weak) UIImageView *guide;
@property(nonatomic, weak) UIImageView *guideLargeText;
@property(nonatomic, weak) UIImageView *guideSmallText;

@end

@implementation LLNewfeatureCollectionViewController

static NSString *identifier = @"customItem";

- (void)viewDidLoad{
    [super viewDidLoad];
    
    // 1.注册一个cell--系统的
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];
    UINib *nib = [UINib nibWithNibName:@"LLCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:identifier];
    // 2.注意:在UICollectionViewController中控制器的View和CollectionView不是同一个View
    //    self.view.backgroundColor = [UIColor redColor];
    self.collectionView.backgroundColor = [UIColor redColor];
    
    // 3. 设置分页效果
    self.collectionView.pagingEnabled = YES;
    // 4.去除滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    // 5.去除弹簧效果
    self.collectionView.bounces = NO;
    
    // 1.添加线条
    UIImageView *guideLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLine"]];
    /*
     CGRect tempFrame = guideLine.frame;
     tempFrame.origin.x = -20;
     guideLine.frame = tempFrame;
     */
    guideLine.x = -20;
    
    [self.collectionView addSubview:guideLine];

    
    // 6.添加其他子控件
    // [self setupChiledView];

}
/*
- (void)setupChiledView
{
    // 1.添加线条
    UIImageView *guideLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLine"]];

    guideLine.x = 20;
     
     [self.collectionView addSubview:guideLine];
    
    // 2.添加大图
    UIImageView *guide = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guide1"]];
    self.guide = guide;

    guide.centerX = LL_WIDTH * 0.5;
    [self.collectionView addSubview:guide];
    
    // 3.添加大文本
    UIImageView *guideLargeText = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    self.guideLargeText = guideLargeText;

    guideLargeText.centerX = LL_WIDTH * 0.5;

    guideLargeText.y = LL_HEIGHT * 0.7;
    [self.collectionView addSubview:guideLargeText];
    
    // 4.添加小文本
    UIImageView *guideSmallText = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    self.guideSmallText = guideSmallText;

    guideSmallText.centerX = LL_WIDTH * 0.5;

    guideSmallText.y = LL_HEIGHT * 0.8;
    [self.collectionView addSubview:guideSmallText];
    
}
*/
/*
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat offset = scrollView.contentOffset.x;
    NSLog(@"%f",offset);
    // 4.修改frame
    
    // 需要判断是向左滚动还是向右滚动
    CGFloat width = LL_WIDTH;
    if (scrollView.contentOffset.x < self.guide.frame.origin.x) {
        // 意味着往左边滚动
        width = -width;
    }

    self.guide.x = width + offset;
    self.guideLargeText.x = width + offset;
    self.guideSmallText.x = width + offset;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.guide.centerX = offset + LL_WIDTH * 0.5;
        self.guideLargeText.centerX = offset + LL_WIDTH * 0.5;
        self.guideSmallText.centerX = offset + LL_WIDTH * 0.5;
    }];
    
//    NSLog(@"%s",__func__);
    // 1.计算当前滚动到的页码
    NSInteger page = scrollView.contentOffset.x / self.view.frame.size.width;
    
//    NSLog(@"%tu",page);
    
    // 2.根据页码生成图片名称
    NSString *guideName = [NSString stringWithFormat:@"guide%tu",page + 1];
    NSString *guideLargeTextName = [NSString stringWithFormat:@"guideLargeText%tu",page + 1];
    NSString *guideSmallTextName = [NSString stringWithFormat:@"guideSmallText%tu",page + 1];
    
    // 3.替换图片
    self.guide.image = [UIImage imageNamed:guideName];
    self.guideLargeText.image = [UIImage imageNamed:guideLargeTextName];
    self.guideSmallText.image = [UIImage imageNamed:guideSmallTextName];
    
}

*/

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
}

#pragma mark -UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 1. 创建自定义cell
    LLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    // 2.赋值
    [cell setIndexPath:indexPath count:4];
    // 3.返回cell
//    
//    // UITabelView 和 UICollectionView有点不太一样--UICollectionView中除了contentView没有其他默认子控件
//    // 设置cell的颜色
//    cell.backgroundColor = [UIColor greenColor];
//    
//    // 创建背景图片
//    UIImageView *iv = [[UIImageView alloc]init];
//    
//    NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground",indexPath.item + 1];
//    UIImage *image = [UIImage imageNamed:imageName];
//    iv.image = image;
//    iv.frame = self.view.bounds;
//    [cell.contentView addSubview:iv];
    return cell;

}

@end
