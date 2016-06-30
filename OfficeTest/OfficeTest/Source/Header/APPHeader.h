//
//  APPHeader.h
//  ProjectMusic
//
//  Created by young on 15/7/31.
//  Copyright (c) 2015年 young. All rights reserved.
//  这里存放普通的app宏定义和声明等信息.

#ifndef Project_APPHeader_h
#define Project_APPHeader_h


#import "MessageListViewController.h"
#import "WorkCollectionViewController.h"
#import "ContactsTableViewController.h"
#import "UserTableViewController.h"
#import "LoginViewController.h"
#import "DataRequestTool.h"

#define Configure [NSUserDefaults standardUserDefaults]
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define GAP (WIDTH/20)

/**
 *  整数是三位数的RGB公式:
 */
#define RGB(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

/**
 *  app 主题颜色
 */
#define COLOR_THEME RGB(87, 123, 248, 1.0f)//[UIColor colorWithRed:87/255.0 green:123/255.0 blue:248/255.0 alpha:1.0]
#define COLOR_BACKGROUND RGB(245, 246, 250, 1.0f)//背景色

/**
 *  app淡灰色空白背景
 */
#import "BackGroundView.h"
#define BGView [BackGroundView new]

#endif
