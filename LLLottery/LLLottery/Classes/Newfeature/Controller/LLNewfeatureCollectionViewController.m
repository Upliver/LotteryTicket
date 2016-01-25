//
//  LLNewfeatureCollectionViewController.m
//  LLLottery
//
//  Created by 李学林 on 16/1/23.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLNewfeatureCollectionViewController.h"

@interface LLNewfeatureCollectionViewController ()

@end

@implementation LLNewfeatureCollectionViewController

static NSString *identifier = @"item";
- (void)viewDidLoad{
    [super viewDidLoad];
    
    // 1.注册一个cell
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];
    // 2.注意:在UICollectionViewController中控制器的View和CollectionView不是同一个View
    //    self.view.backgroundColor = [UIColor redColor];
    self.collectionView.backgroundColor = [UIColor redColor];
}

#pragma mark -UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    // UITabelView 和 UICollectionView有点不太一样--UICollectionView中除了contentView没有其他默认子控件
    // 设置cell的颜色
    cell.backgroundColor = [UIColor greenColor];
    
    // 创建背景图片
    UIImageView *iv = [[UIImageView alloc]init];
    
    NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground",indexPath.item + 1];
    UIImage *image = [UIImage imageNamed:imageName];
    iv.image = image;
    iv.frame = self.view.bounds;
    [cell.contentView addSubview:iv];
    return cell;

}

@end
