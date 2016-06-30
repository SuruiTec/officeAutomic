//
//  AppDelegate.m
//  OfficeTest
//
//  Created by suruikeji on 16/6/7.
//  Copyright © 2016年 com.SuRuikeji.fany. All rights reserved.
//

#import "AppDelegate.h"
#import <RongIMKit/RongIMKit.h>
#import "TabbarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window makeKeyAndVisible];    
    
    BOOL isLogin = [Configure boolForKey:@"isLogin"];
    NSLog(@"isLogin or SUCCESS:%d",isLogin);
    if (/* DISABLES CODE */ (0)) {
        LoginViewController *lvc = [[LoginViewController alloc] init];
        [self.window setRootViewController:lvc];
        return YES;
    }
    
    //注册融云APPKEY
    [[RCIM sharedRCIM] initWithAppKey:APPKEY];
    
    /**
     *  通过TOKEN连接融云服务器
     */
    [[RCIM sharedRCIM] connectWithToken:TOKEN2 success:^(NSString *userId) {//成功连接融云服务器
        NSLog(@"登录成功,当前用户ID为:%@",userId);
    } error:^(RCConnectErrorCode status) {//连接失败
        NSLog(@"错误状态码为:%ld",(long)status);
    } tokenIncorrect:^{//token无效或token过期
        NSLog(@"TOKEN无效");
    }];

    /**
     tabbar控制器
     */
    TabbarController *MainVC = [TabbarController new];
    [self.window setRootViewController:MainVC];
    
    /**
     *  设置导航栏样式
     */
    [[UINavigationBar appearance]setBarStyle:UIBarStyleBlackOpaque];
    [[UINavigationBar appearance]setBarTintColor:COLOR_THEME];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
