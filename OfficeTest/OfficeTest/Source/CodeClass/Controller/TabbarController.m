//
//  TabbarController.m
//  OfficeTest
//
//  Created by suruikeji on 16/6/30.
//  Copyright © 2016年 com.SuRuikeji.fany. All rights reserved.
//

#import "TabbarController.h"

@interface TabbarController ()

@end

@implementation TabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar setBarTintColor:[UIColor whiteColor]];

    /**
     消息
     */
    NSArray *displayArr = @[@(ConversationType_PRIVATE),@(ConversationType_DISCUSSION), @(ConversationType_APPSERVICE), @(ConversationType_PUBLICSERVICE),@(ConversationType_GROUP),@(ConversationType_SYSTEM)];
    
    MessageListViewController *message = [[MessageListViewController alloc] initWithDisplayConversationTypes:displayArr collectionConversationType:displayArr];
    
    [self interceptSubVC:message];
    
    /**
     工作
     */
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    flowLayout.itemSize = CGSizeMake(120, 100);
    
    WorkCollectionViewController *work = [[WorkCollectionViewController alloc] initWithCollectionViewLayout:flowLayout];
    [self interceptSubVC:work];
    
    /**
     联系人
     */
    ContactsTableViewController *contact = [[ContactsTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self interceptSubVC:contact];
    
    /**
     我的
     */
    UserTableViewController *me = [[UserTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self interceptSubVC:me];

}

/**
 *  拦截子控制器进行加工处理
 *
 *  @param vc 用作TabBarController的子控制器
 */
-(void)interceptSubVC:(UIViewController *)vc{
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
