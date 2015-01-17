//
//  MenuViewController.m
//  Bull
//
//  Created by wangmeng on 15/1/13.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import "MenuViewController.h"
#import "UserInfoViewController.h"
#import "ModuleListViewController.h"
#import "HelperViewController.h"
#import "SettingViewController.h"
#import "AddModuleViewController.h"

@interface MenuViewController ()
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userStatus;
@property (weak, nonatomic) IBOutlet UILabel *lableMyDeices;
@end

@implementation MenuViewController{
    
    UINavigationController * mListView;
    UINavigationController * userView;
    UINavigationController * helperView;
    UINavigationController * settingView;
    UINavigationController * addView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //mListView = [[UINavigationController alloc]initWithRootViewController:[[ModuleListViewController alloc]init]];
    //userView = [[UINavigationController alloc]initWithRootViewController:[[UserInfoViewController alloc]init]];
    //helperView = [[UINavigationController alloc]initWithRootViewController:[[HelperViewController alloc]init]];
    //settingView = [[UINavigationController alloc]initWithRootViewController:[[SettingViewController alloc]init]];
    //addView = [[UINavigationController alloc]initWithRootViewController:[[SettingViewController alloc]init]];
        UIStoryboard * storybroad = [UIStoryboard storyboardWithName:@"Iphone" bundle:nil];
        
        userView =  [storybroad instantiateViewControllerWithIdentifier:@"UserInfoNavigationController"];
        mListView = [storybroad instantiateViewControllerWithIdentifier:@"DevListNavigationController"];
        helperView = [storybroad instantiateViewControllerWithIdentifier:@"HelperNavigationController"];
        addView = [storybroad instantiateViewControllerWithIdentifier:@"AddNavigationController"];
        settingView = [storybroad instantiateViewControllerWithIdentifier:@"SettingNavigationController"];
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

- (IBAction)UserNamePressed:(id)sender {
    
    //[[DMDrawerController shareInstence] presentCenterViewController:userView Animated:YES];
    
    [[DMDrawerController shareInstence] setCenterViewController:userView withCloseAnimation:YES completion:^(BOOL finished){
        if(finished)
            [userView viewDidAppear:YES];
    }];
}

- (IBAction)myModuleListPressed:(id)sender {
    //[_sl presentCenterViewController:mListView Animated:YES];
    [[DMDrawerController shareInstence] setCenterViewController:mListView withCloseAnimation:YES completion:^(BOOL finished){
        if(finished)
            [mListView viewDidAppear:YES];
    }];
}

- (IBAction)helpPressed:(id)sender {
    //[_sl presentCenterViewController:helperView Animated:YES];
    [[DMDrawerController shareInstence] setCenterViewController:helperView withCloseAnimation:YES completion:^(BOOL finished){
        if(finished)
            [helperView viewDidAppear:YES];
    }];
}
- (IBAction)settingPressed:(id)sender {
    //[_sl presentCenterViewController:settingView Animated:YES];
    [[DMDrawerController shareInstence] setCenterViewController:settingView withCloseAnimation:YES completion:^(BOOL finished){
        if(finished)
            [settingView viewDidAppear:YES];
    }];
}
- (IBAction)addDevicePressed:(id)sender {
    //[_sl presentCenterViewController:addView Animated:YES];
    [[DMDrawerController shareInstence] setCenterViewController:addView withCloseAnimation:YES completion:^(BOOL finished){
        if(finished)
            [addView viewDidAppear:YES];
    }];
}

@end
