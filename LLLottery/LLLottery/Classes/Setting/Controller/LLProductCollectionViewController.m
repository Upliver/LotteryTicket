//
//  LLProductCollectionViewController.m
//  LLLottery
//
//  Created by 李学林 on 16/2/2.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLProductCollectionViewController.h"
#import "LLProduct.h"
#import "LLProductCell.h"

@interface LLProductCollectionViewController ()

@property(nonatomic, strong) NSArray *products;

@end

@implementation LLProductCollectionViewController

- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(100, 100);
    if (self = [super initWithCollectionViewLayout:layout]) {
        
    }
    return self;
}

static NSString * const identifier = @"productItem";

- (void)viewDidLoad {
    [super viewDidLoad];
    
//
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:@"LLProductCell" bundle:nil] forCellWithReuseIdentifier:identifier];

    self.collectionView.backgroundColor = [UIColor whiteColor];
}



#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LLProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier  forIndexPath:indexPath];
    
    cell.product = self.products[indexPath.item];
    
    return cell;
}

#pragma mark -lazy
- (NSArray *)products
{
    if (!_products) {
        NSString *productsPath = [[NSBundle mainBundle]pathForResource:@"products.json" ofType:nil];
        NSData *tempData = [NSData dataWithContentsOfFile:productsPath];
        
        // 将二进制数据转换成数组
        NSArray *dictArray = [NSJSONSerialization JSONObjectWithData:tempData options:NSJSONReadingMutableLeaves error:NULL];
        
        // 字典转模型
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            LLProduct *product = [LLProduct productWithDict:dict];
            [tempArray addObject:product];
        }
        // 深拷贝
        _products = [tempArray copy] ;
    }
    return _products;
}

@end
