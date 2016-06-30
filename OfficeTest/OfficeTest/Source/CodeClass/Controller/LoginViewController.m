//
//  LoginViewController.m
//  OfficeTest
//
//  Created by suruikeji on 16/6/8.
//  Copyright © 2016年 com.SuRuikeji.fany. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property(strong,nonatomic)UITextField *userTextField;
@property(strong,nonatomic)UITextField *pwdTextField;


@end

@implementation LoginViewController

-(instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.userTextField = [[UITextField alloc] initWithFrame:CGRectMake(2*GAP, 5*GAP, WIDTH-4*GAP, 3*GAP)];
    self.userTextField.backgroundColor = [UIColor cyanColor];
    
    self.userTextField.placeholder = @"请输入用户名:";
    
    [self.view addSubview:self.userTextField];
    
    self.pwdTextField = [[UITextField alloc] initWithFrame:CGRectMake(2*GAP, CGRectGetMaxY(self.userTextField.frame)+2*GAP, WIDTH-4*GAP, 3*GAP)];
    
    self.pwdTextField.backgroundColor = [UIColor cyanColor];
    
    self.pwdTextField.placeholder = @"请输入密码:";
    
    [self.view addSubview:self.pwdTextField];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    loginBtn.frame = CGRectMake(8*GAP, CGRectGetMaxY(self.pwdTextField.frame)+3*GAP, 4*GAP, 3*GAP);
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.backgroundColor = [UIColor greenColor];
    
    [loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:loginBtn];
    
    
    
}

- (void)login:(UIButton *)btn
{
    NSLog(@"login process ...");
   
    if ([self.userTextField.text isEqualToString:@""]||[self.pwdTextField.text isEqualToString:@""])
    {
        NSLog(@"用户名或密码不能为空");
        return ;
    }
    
    [Configure setBool:YES forKey:@"isLogin"];
    
    NSString *string = @"{'bizname':'User','method':'login','token':'669a67230fd384ac8b49639010d6276e','sign':'97CE714410790F77368EE382300D94C3','body':{'phone':'13417098816','password':''}}";
    

    NSLog(@"efstring:%@",string);
    
//    string= [string base64EncodedString];
    NSLog(@"testString:%@",string);
    
    
    NSData *sdata = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"sdata:%@",sdata);
    
    [[DataRequestTool shareData] requestDataWithUrl:URL method:YES data:string andBlock:^(NSData *data) {
        
        NSError *error;
        
        NSString *converString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"converString:=========================++++++++++++++++%@",converString);
        
        NSString *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"Data Parse Error :%@",error.description);
        } else{
            NSLog(@"dictionary:%@",dict);
            [dict writeToFile:@"/Users/suruikeji/Desktop/dict.plist" atomically:YES];
           
        }  
        
    
    
    
    
    [[DataRequestTool shareData]requestDataWithUrl:TESTURL method:NO data:nil andBlock:^(NSData *data) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"allKeys%@",dict);
        
    }];
    
    
    
    NSString *newString = @"{\"status\":100}";
    
    NSLog(@"dskjfkldjgd=============================:%@",newString);
    
    
    NSDictionary *lldict = [NSJSONSerialization JSONObjectWithData:[newString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"lldict:==================================%@",lldict);
    
    NSDictionary *dicdd = @{@"jdsf":@100};
    
    NSLog(@"dicdd:%@",dicdd);
    
    
    

    

    

    
    
//    NSURL *url = [NSURL URLWithString:URL];
//    
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
//                                    
//    [request setHTTPMethod:@"POST"];
//    
//                                    [request setHTTPBody:sdata];
//    
//    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSDictionary *dictl = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        NSLog(@"dsavdsav%@",dictl);
//    }];
//    [dataTask resume];

//    [[DataRequestTool shareData] requestDataWithUrl:URL data:dict andBlock:^(NSData *data) {
//        
//        NSError *error = nil;
//        
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
//        if (error) {
//            NSLog(@"parse data error : %@",error.description);
//        } else
//        {
//            NSLog(@"parse data content: %@",dict);
//        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
