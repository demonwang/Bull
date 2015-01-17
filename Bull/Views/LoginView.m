//
//  LoginView.m
//  Bull
//
//  Created by wangmeng on 15/1/12.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import "LoginView.h"
#import "DMDrawerController.h"

#import "VIewUtil.h"
#import "UIViewController+AlertShow.h"
#import "UserManger.h"

@interface LoginView ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;

@property (weak, nonatomic) IBOutlet UITextField *userPswdTF;
@end

@implementation LoginView



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView * tabBgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_bg.png"]];
    tabBgView.frame = [UIScreen mainScreen].applicationFrame;
    [self.tableView setBackgroundView:tabBgView];
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
- (IBAction)loginButtonPressed:(id)sender {
    //MySlideMenuController *sl = [MySlideMenuController shareInstence];
   // DMUINavigationController * nv = [[DMUINavigationController alloc]initWithRootViewController:sl];
    NSString * userName = _userNameTF.text;
    NSString * userPswd = _userPswdTF.text;
    
    
    if(![VIewUtil isPhone:userName]&&![VIewUtil isEmail:userName]){
        //[VIewUtil showErrAlertWithMessage:@"输入用户名错误"];
       // [[[UIAlertView alloc]initWithTitle:@"err" message:@"cuowu " delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil] show];
        [self showAlertWithErrMsg:@"输入的邮箱或者手机错误"];
        return ;
    }
    
    if(userPswd == nil||userPswd.length < 6 || userPswd.length > 32){
        //[VIewUtil showErrAlertWithMessage:@"输入的密码错误"];
        //[VIewUtil showErrAlertWithMessage:@"输入的密码错误" tarView: self.view];
        [self showAlertWithErrMsg:@"输入的密码错误"];
        return ;
    }
    
    
    if([[UserManger shareInstence] LoginByUserName:userName pswd:userPswd]){
        [self presentViewController:[[DMDrawerController alloc]init] animated:YES completion:^(){
            [VIewUtil setLogined:userPswd pasw:userPswd];
        }];
    }else{
        [self showAlertWithErrMsg:@"登录出错，请检查自己的用户和密码，或者网络是否连接 "];
        return ;
    }

}


#pragma segue

-(IBAction)onRegistBack:(UIStoryboardSegue *)segue{
    
}


@end
