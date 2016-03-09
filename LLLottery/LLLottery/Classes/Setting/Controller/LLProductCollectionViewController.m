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
/**
 *  当选中某一个cell时候会调用
 *
 */
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__func__);
    
    // 1.判断能否打开,能打开就代表已经安装---->直接打开对应的应用程序就ok了
    // 1.1.取出对应cell的模型
        LLProduct *product = self.products[indexPath.item];
    // 1.2 取出对应程序头和地址,拼接成用于跳转的Url
    NSString *urlStr = [NSString stringWithFormat:@"%@://%@",product.scheme,product.identifier];
    NSURL *url = [NSURL URLWithString:urlStr ];
    UIApplication *app = [UIApplication sharedApplication] ;
    BOOL open = [app canOpenURL:url];
    if (open) {
        // 打开APPP
        [app openURL:url];
    }else{
        // 2.没有安装--->跳转到AppStore上
        // 从模型中取出appid
        url = [NSURL URLWithString:product.url];
        [app openURL:url];
        
    }
    
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
