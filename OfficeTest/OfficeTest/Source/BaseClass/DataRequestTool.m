//
//  DataRequestTool.m
//  OfficeTest
//
//  Created by suruikeji on 16/6/8.
//  Copyright © 2016年 com.SuRuikeji.fany. All rights reserved.
//

#import "DataRequestTool.h"

static DataRequestTool *dataTool = nil;

@implementation DataRequestTool


+(DataRequestTool *)shareData
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataTool = [[DataRequestTool alloc] init];
    });
    return dataTool;
}

-(void)requestDataWithUrl:(NSString *)urlString method:(BOOL)isPost data:(NSString *)postString andBlock:(myBlock)block
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    if (isPost) {
        [request setHTTPMethod:@"POST"];
    } else{
        [request setHTTPMethod:@"GET"];
    }
    
    
    NSString *encodeString = [postString base64EncodedString];
    
    [request setHTTPBody:[encodeString dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"error code: %@",error.description);
             NSLog(@"response code: %@",response.description);
        } else{
            block(data);
        }
    }];
    [dataTask resume];
    

}

/**
 *  网络请求--POST
 *
 *  @param bizname 模块
 *  @param method  请求方法：每个请求都有它的唯一请求方法名，用以区分其它请求方法。
 *  @param body    参数
 */
-(void)POSTWithBizName:(NSString *)bizname method:(NSString *)method body:(NSMutableDictionary *)body{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"text/plain; charset=utf-8", @"application/json", nil];
    
    /**
     *  获取用户信息getUserInfo
     */
    //模块名、方发名、签名:［(模块名＋方发名＋token值) MD5Hash加密］
//    NSString *bizname = @"User";
//    NSString *method = @"getUserInfo";
    NSString *sign = [[NSString stringWithFormat:@"%@%@%@", TOKEN2, bizname, method] MD5Hash];
    
    //二级字典UserID
//    NSMutableDictionary *body = [NSMutableDictionary new];
//    NSString *UserID            = ID2;
//    [body setValue:UserID forKey:@"UserID"];
    
    //包装外层字典
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setValue:bizname  forKey:@"bizname"];
    [dict setValue:method   forKey:@"method"];
    [dict setValue:TOKEN2   forKey:@"token"];
    [dict setValue:sign     forKey:@"sign"];
    [dict setValue:body     forKey:@"body"];
    
    //登录接口
    /**
     *  NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
     
     [dict setValue:@"User" forKey:@"bizname"];
     
     [dict setValue:@"UserInfo" forKey:@"method"];
     
     [dict setValue:@"6d2448598542c566d7b80afc505f144c" forKey:@"token"];
     
     [dict setValue:@"3C644AC1FD6D8A047EF4590954702580" forKey:@"sign"];
     
     
     NSMutableDictionary *subDict = [[NSMutableDictionary alloc] init];
     [subDict setValue:ID1 forKey:@"UserID"];
     
     [subDict setValue:@"13417098816" forKey:@"Phone"];
     [subDict setValue:@"" forKey:@"password"];
     [subDict setValue:@"XXXX" forKey:@"IMEI"];
     [subDict setValue:@"IOS6.2" forKey:@"System"];
     [subDict setValue:@"XXXX001" forKey:@"Version"];
     
     
     [dict setValue:subDict forKey:@"body"];
     */
    
    /**
     *  字典转化成字符串：NSDictionary --> NSData --> NSString
     */
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    NSString *paramsString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    paramsString = [paramsString base64EncodedString];
    
    NSLog(@"请求之前打印json数据：%@", dict);
    
    //manager对象 调用POST请求方法进行请求
    [manager POST:@"http://sroa.api.web/api/call" parameters:paramsString progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];//转化成字典（即json格式数据）
        NSLog(@"请求之后打印json数据：%@", dict);
        //保存...
        //获取token成功回调...
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败：%@", error);
    }];

}


@end
