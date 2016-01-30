//
//  LLTableViewCell.m
//  LLLottery
//
//  Created by 李学林 on 16/1/30.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLTableViewCell.h"

@implementation LLTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"customCell";
    LLTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[LLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

- (void)setItem:(LLSettingItem *)item
{
    _item = item;
    
    // 1.根据传入的数据模型设置需要显示的数据
    self.imageView.image = item.image;
    self.textLabel.text = item.title;
    // 2.根据cell传入的模型,设置辅助视图
    // 如果是箭头模型,那么辅助视图就是箭头,如果是开关模型,那么辅助视图就是开关.....
    [self setupRightView];
}
/**
 *  设置右边的辅助视图
 */
- (void)setupRightView
{
    NSLog(@"%@",_item.class);
    // 1.判断当前cell对应的模型的类型
    if ([self.item isKindOfClass:[LLSettingItemArrow class]]) {
        // 箭头
        self.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow_right"]];
    }else if ([self.item isKindOfClass:[LLSettingItemSwitch class]]){
        // 开关
        self.accessoryView = [[UISwitch alloc]init];
    }else if([self.item isKindOfClass:[LLSettingItemLabel class]]){
        // 标签
        self.accessoryView = [[UILabel alloc] init];
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
