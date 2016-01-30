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

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
