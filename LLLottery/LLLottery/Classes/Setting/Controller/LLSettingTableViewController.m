//
//  LLSettingTableViewController.m
//  LLLottery
//
//  Created by 李学林 on 16/1/29.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLSettingTableViewController.h"

@interface LLSettingTableViewController ()
@property(nonatomic, strong) NSArray *datas;
@end

@implementation LLSettingTableViewController
- (instancetype)initWithStyle:(UITableViewStyle)style{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    return self;
}

// 重写init方法
- (instancetype)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    return self;
}

#pragma mark -懒加载datas

- (NSArray *)datas
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"setting.plist" ofType:nil];
    if (!_datas) {
        _datas = [NSArray arrayWithContentsOfFile:path];
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    NSLog(@"%tu",self.datas.count);
    return self.datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    /*
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 4;
    }else if(section == 2){
        return 4;
    }
    return 0;
     */
    // 1.取出对应的租
    NSArray *group = self.datas[section];
    // 2.返回对应租的个数
    return group.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"customCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    /*
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"使用兑换码";
        }
    }else if(indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"使用兑换码";
        }else if(indexPath.row == 1){
            cell.textLabel.text = @"使用兑换码";

        }else if(indexPath.row == 2){
            cell.textLabel.text = @"使用兑换码";

        }else if(indexPath.row == 3){
            cell.textLabel.text = @"使用兑换码";

        }
    }else if(indexPath.section == 2){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"使用兑换码";

        }else if(indexPath.row == 1){
            cell.textLabel.text = @"使用兑换码";

        }else if(indexPath.row == 2){
            cell.textLabel.text = @"使用兑换码";

        }else if(indexPath.row == 3){
            cell.textLabel.text = @"使用兑换码";

        }
    }
     */
    
    // 1.取出对应的组
    NSArray *group = _datas[indexPath.section];
    // 2.取出对应的行
    NSDictionary *row = group[indexPath.row];
    // 3.设置数据
    cell.imageView.image = [UIImage imageNamed:row[@"icon"]];
    cell.textLabel.text = row[@"title"];
    return cell;
}


@end
