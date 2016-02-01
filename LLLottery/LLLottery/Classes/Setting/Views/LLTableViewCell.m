//
//  LLTableViewCell.m
//  LLLottery
//
//  Created by 李学林 on 16/1/30.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLTableViewCell.h"

@interface LLTableViewCell ()
@property(nonatomic, strong) UIImageView *arrowAccessoryView;
@property(nonatomic, strong) UISwitch *switchAccessoryView;
@property(nonatomic, strong) UILabel *lableAccessoryView;

@end

@implementation LLTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"customCell";
    LLTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[LLTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    return cell;
}

- (void)setItem:(LLSettingItem *)item
{
    _item = item;
    
    // 1.根据传入的数据模型设置需要显示的数据
    self.imageView.image = item.image;
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subTitle;
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
//        self.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow_right"]];
        self.accessoryView = self.arrowAccessoryView;
    }else if ([self.item isKindOfClass:[LLSettingItemSwitch class]]){
        // 开关
//        UISwitch *sw = [[UISwitch alloc]init];
        // 根据模型的数据,来设置开关的状态
        LLSettingItemSwitch *switchItem = (LLSettingItemSwitch *)self.item;
//        sw.on = switchItem.open;
//        self.accessoryView = sw;
        self.switchAccessoryView.on = NO;
        self.switchAccessoryView.on = switchItem.open;
        self.accessoryView = self.switchAccessoryView;
    }else if([self.item isKindOfClass:[LLSettingItemLabel class]]){
        // 标签
//        self.accessoryView = [[UILabel alloc] init];
        self.accessoryView = self.lableAccessoryView;
    }else {
        self.accessoryView = nil;
    }
}

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}

#pragma mark - lazy
- (UIImageView *)arrowAccessoryView
{
    if (_arrowAccessoryView == nil) {
        _arrowAccessoryView = [[UIImageView alloc]initWithImage:[UIImage  imageNamed:@"arrow_right"]];
    }
    return _arrowAccessoryView;
}
- (UISwitch *)switchAccessoryView
{
    if (!_switchAccessoryView) {
        _switchAccessoryView = [[UISwitch alloc]init];
    }
    return _switchAccessoryView;
}

- (UILabel *)lableAccessoryView
{
    if (!_lableAccessoryView) {
        _lableAccessoryView = [[UILabel alloc]init];
    }
    return _lableAccessoryView;
}

@end
