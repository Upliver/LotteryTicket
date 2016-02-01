
//  LLProductCell.m
//  LLLottery
//
//  Created by 李学林 on 16/2/2.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLProductCell.h"
@interface LLProductCell()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end

@implementation LLProductCell

- (void)setProduct:(LLProduct *)product
{
    _product = product;
    
    self.icon.image = [UIImage imageNamed:_product.icon];
    self.title.text = _product.title;
}
@end
