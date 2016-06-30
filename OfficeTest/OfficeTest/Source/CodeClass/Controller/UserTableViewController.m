//
//  UserTableViewController.m
//  OfficeTest
//
//  Created by suruikeji on 16/6/7.
//  Copyright © 2016年 com.SuRuikeji.fany. All rights reserved.
//

#import "UserTableViewController.h"
#import "UserContentTableViewCell.h"//“我的”内容cell
#import "UserAccountTableViewCell.h"//“我的”帐号cell

@interface UserTableViewController ()

@end

@implementation UserTableViewController{
    NSArray *imgArr;//图片数组
    NSArray *titleArr;//标题数组
}

-(instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [self.tabBarItem setImage:[[UIImage imageNamed:@"footer_my_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [self.tabBarItem setSelectedImage:[[UIImage imageNamed:@"footer_my_icon_cur"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [self.navigationItem setTitle:@"个人中心"];
        [self.tabBarItem setTitle:@"我的"];
        self.tableView.tableFooterView = [UIView new];
        imgArr = [NSArray arrayWithObjects:@"my_file", @"unit", @"set", nil];
        titleArr = [NSArray arrayWithObjects:@"我的文件", @"单位信息", @"设置", nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.view.backgroundColor = COLOR_BACKGROUND;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source 表视图数据源

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//return the number of sections
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//return the number of rows
    if (section == 0) {
        return 1;
    }
    return titleArr.count*2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 20;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100;
    }else{
        if (indexPath.row%2 == 0) {
            return 42;
        }else{
            return 10;
        }
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return BGView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        static NSString *identifier = @"accountCell";
        UserAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[UserAccountTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        // Configure the cell...
        
        return cell;
        
    }else{
        
        static NSString *identifier = @"contentCell";
        UserContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[UserContentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        // Configure the cell...
        cell.hidden = indexPath.row%2;
        cell.userInteractionEnabled = !(indexPath.row%2);
        
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = [UIColor whiteColor];
            cell.imageView.image = [UIImage imageNamed:imgArr[indexPath.row/2]];
            cell.textLabel.text = titleArr[indexPath.row/2];
        }else{
            cell.backgroundColor = COLOR_BACKGROUND;
        }
        
        return cell;
        
    }
}

#pragma mark - Table View delegate method 表视图代理方法


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
