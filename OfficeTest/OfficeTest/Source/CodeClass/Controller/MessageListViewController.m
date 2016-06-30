//
//  MessageListViewController.m
//  OfficeTest
//
//  Created by suruikeji on 16/6/7.
//  Copyright © 2016年 com.SuRuikeji.fany. All rights reserved.
//

#import "MessageListViewController.h"

@interface MessageListViewController ()

@property(nonatomic,strong)RCConversationModel *tempModel;

@property(nonatomic,assign)BOOL isClick;

- (void)updateBadgeValueForTabBarItem;

@end

@implementation MessageListViewController

-(void)updateBadgeValueForTabBarItem
{
    
}

- (id)initWithDisplayConversationTypes:(NSArray *)displayConversationTypeArray collectionConversationType:(NSArray *)collectionConversationTypeArray
{
    self = [super initWithDisplayConversationTypes:displayConversationTypeArray collectionConversationType:collectionConversationTypeArray];
    if (self) {
        [self.tabBarItem setImage:[[UIImage imageNamed:@"footer_news_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [self.tabBarItem setSelectedImage:[[UIImage imageNamed:@"footer_news_icon_cur"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [self.navigationItem setTitle:@"消息"];
        [self.tabBarItem setTitle:@"消息"];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.conversationListTableView.separatorColor = [UIColor blueColor];
    self.conversationListTableView.tableFooterView = [UIView new];

    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _isClick = YES;
    if (!self.isEnteredToCollectionViewController) {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:19];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = @"会话";
        self.navigationController.navigationItem.titleView = titleLabel;
    }
    
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
    [rightBtn setImage:[UIImage imageNamed:@"add_icon"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(showMenu:) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTintColor:[UIColor whiteColor]];
    
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    [self notifyUpdateUnreadMessageCount];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNeedRefreshNotification) name:@"kRCNeedReloadDiscussionListNotification" object:nil];
    
    self.navigationItem.rightBarButtonItem = barBtn;
    
}

- (void)showMenu:(UIButton *)btn{
    
    NSArray *menuItems = @[[KxMenuItem menuItem:@"发起会话" image:[UIImage imageNamed:@"announcement"] target:self action:@selector(pushAddSession:)],[KxMenuItem menuItem:@"发起广播" image:[UIImage imageNamed:@"announcement"] target:self action:@selector(pushAddSystem:)]];
    
    [KxMenu showMenuInView:self.view fromRect:CGRectMake(400, 0, -100, 0) menuItems:menuItems];
    
    
    
    
}

- (void)pushAddSession:(id)sender
{
    NSLog(@"添加会话");
}

- (void)pushAddSystem:(id)sender
{
    NSLog(@"添加广播");
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}



@end
