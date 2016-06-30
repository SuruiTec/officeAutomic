//
//  DataRequestTool.h
//  OfficeTest
//
//  Created by suruikeji on 16/6/8.
//  Copyright © 2016年 com.SuRuikeji.fany. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^myBlock)(NSData *data);

@interface DataRequestTool : NSObject


+(DataRequestTool *)shareData;


-(void)requestDataWithUrl:(NSString *)urlString method:(BOOL)isPost data:(NSString *)postString andBlock:(myBlock) block;

/**
 *  网络请求--POST
 *
 *  @param bizname 模块，API指定了模块名称
 *  @param method  请求方法：每个请求都有它的唯一请求方法名，用以区分其它请求方法;API文档有指定方法名称。
 *  @param body    参数，详情见API文档
 */
-(void)POSTWithBizName:(NSString *)bizname method:(NSString *)method body:(NSMutableDictionary *)body;

@end
