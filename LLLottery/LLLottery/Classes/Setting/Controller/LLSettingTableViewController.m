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

//#define LLSettingTypeAlert @"alert"
//#define LLSettingTypePush @"push"

@interface LLSettingTableViewController ()

@property(nonatomic, strong) NSMutableArray *datas;

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
        /*
//        // 1.创建第一组模型
//        LLSettingItem *item11 = [[LLSettingItem alloc] init];
//        item11.icon = @"RedeemCode";
//        item11.title = @"使用兑换码";
//        // 将第一组数据模型添加到数组中
//        NSArray *group1 = @[item11];
//        // 2.创建第二组模型
//        LLSettingItem *item21 = [[LLSettingItem alloc] init];
//        item21.icon = @"MorePush";
//        item21.title = @"推送和提醒";
//        
//        LLSettingItem *item22 = [[LLSettingItem alloc] init];
//        item22.icon = @"more_homeshake";
//        item22.title = @"使用摇一摇机选";
////        item22.type = LLSettingTypeAlert;
//        item22.option = ^(){
//            
//            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"没有新的版本可以更新" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//            [alert show];
//            
//        };
//        // 将第二组数据模型添加到数组中
//        NSArray *group2 = @[item21,item22];
//        // 3.将两组的数组添加到大数组中
//        _datas = @[group1,group2];
        
        */
        // 1.创建数组
        _datas = [NSMutableArray array];
        // 2.添加每一组数据
        [self addGroup0];
        [self addGroup1];
        [self addGroup2];
    }
    return _datas;
}

- (void)addGroup0
{
    LLSettingItem *redeemCode = [LLSettingItem initWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
//    redeemCode.accessoryViewType = LLCellAccessoryViewTypeArrow;
    [self.datas addObject:@[redeemCode]];
}
- (void)addGroup1
{
    LLSettingItem *morePush = [LLSettingItem initWithImage:[UIImage imageNamed:@"MorePush"] title:@"推送和提醒"];
    LLSettingItem *more_homeshake = [LLSettingItem initWithImage:[UIImage imageNamed:@"more_homeshake"] title:@"摇一摇机选"];
    LLSettingItem *sound_Effect = [LLSettingItem initWithImage:[UIImage imageNamed:@"sound_Effect"] title:@"声音效果"];
    LLSettingItem *More_LotteryRecommend = [LLSettingItem initWithImage:[UIImage imageNamed:@"More_LotteryRecommend"] title:@"购彩小助手"];
    
    [self.datas addObject:@[morePush,more_homeshake,sound_Effect,More_LotteryRecommend]];
}
- (void)addGroup2
{
    LLSettingItem *redeemCode = [LLSettingItem initWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    LLSettingItem *MoreShare = [LLSettingItem initWithImage:[UIImage imageNamed:@"MoreShare"] title:@"分享"];
    LLSettingItem *MoreNetease = [LLSettingItem initWithImage:[UIImage imageNamed:@"MoreNetease"] title:@"产品推荐"];
    LLSettingItem *MoreAbout = [LLSettingItem initWithImage:[UIImage imageNamed:@"MoreAbout"] title:@"关于"];
    [self.datas addObject:@[redeemCode,MoreShare,MoreNetease,MoreAbout]];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
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
        // 设置cell右边的小箭头
        // cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.accessoryView = [[UISwitch alloc]init];
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
    cell.imageView.image = item.image;
    cell.textLabel.text = item.title;
    /*
    // 4.设置cell的一个辅助视图(cell的右边的视图)
    switch (item.accessoryViewType) {
        case LLCellAccessoryViewTypeArrow:
            cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow_right"]];
            break;
        case LLCellAccessoryViewTypeSwitch:
            cell.accessoryView = [[UISwitch alloc]init];
            break;
        case LLCellAccessoryViewTypeLabel:
            cell.accessoryView = [[UILabel alloc]init];
            break;
            
        default:
            cell.accessoryView = nil;
            break;
    }
     */
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
    
    // 1.取出对应的组
    NSArray *group = _datas[indexPath.section];
    // 2.取出对应的行
    LLSettingItem *item = group[indexPath.row];
    /*
    // 3.执行存放好的代码(方法)
    if (item.type == LLSettingTypeAlert) {
        [item show];
    }
     */
    if (item.option != nil) {
        item.option();
    }
}


@end
