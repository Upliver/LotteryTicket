//
//  LLSettingTableViewController.m
//  LLLottery
//
//  Created by 李学林 on 16/1/29.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "LLSettingTableViewController.h"
#import "LLSettingItem.h"

//typedef enum {
//    
//    LLSettingTypeAlert,
//    LLSettingTypePush
//    
//} LLSettingType;

#define LLSettingTypeAlert @"alert"
#define LLSettingTypePush @"push"

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

    if (!_datas) {
     /*
     NSString *path = [[NSBundle mainBundle] pathForResource:@"setting.plist" ofType:nil];
        _datas = [NSArray arrayWithContentsOfFile:path];
     */
        // 1.创建第一组模型
        LLSettingItem *item11 = [[LLSettingItem alloc] init];
        item11.icon = @"RedeemCode";
        item11.title = @"使用兑换码";
        // 将第一组数据模型添加到数组中
        NSArray *group1 = @[item11];
        // 2.创建第二组模型
        LLSettingItem *item21 = [[LLSettingItem alloc] init];
        item21.icon = @"MorePush";
        item21.title = @"推送和提醒";
        
        LLSettingItem *item22 = [[LLSettingItem alloc] init];
        item22.icon = @"more_homeshake";
        item22.title = @"使用摇一摇机选";
        // 将第二组数据模型添加到数组中
        NSArray *group2 = @[item21,item22];
        // 3.将两组的数组添加到大数组中
        _datas = @[group1,group2];
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
    /*
    // 1.取出对应的组
    NSArray *group = _datas[indexPath.section];
    // 2.取出对应的行
    NSDictionary *row = group[indexPath.row];
    // 3.设置数据
    cell.imageView.image = [UIImage imageNamed:row[@"icon"]];
    cell.textLabel.text = row[@"title"];
     */
    // 1.取出对应的组
    NSArray *group = _datas[indexPath.section];
    // 2.取出对应的行
    LLSettingItem *item = group[indexPath.row];
    // 3.设置数据
    cell.imageView.image = [UIImage imageNamed:item.icon];
    cell.textLabel.text = item.title;
    
    return cell;
}


// 选中某一行的时候调用这个方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // NSLog(@"%tu--------%tu",indexPath.section,indexPath.row);
    /*
    if (indexPath.section == 2 && indexPath.row == 0) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"没有新的版本可以更新" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }
*/
    
    /*
    // 1.取出对应的组
    NSArray *group = _datas[indexPath.section];
    // 2.取出对应的行
    NSDictionary *row = group[indexPath.row];
    // 3.取出对应行中的type
    NSString *type = row[@"type"];
    
    if ([type isEqualToString:LLSettingTypeAlert]) {
     
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"没有新的版本可以更新" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }else {
        NSLog(@"push到新的控制器中");
    }
    */
}


@end
