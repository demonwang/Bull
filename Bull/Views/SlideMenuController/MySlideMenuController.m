//
//  MySlideMenuController.m
//  Bull
//
//  Created by wangmeng on 15/1/13.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import "MySlideMenuController.h"
#import "MenuViewController.h"


static MySlideMenuController * me = nil;
@interface MySlideMenuController ()

@end


@implementation MySlideMenuController

+(instancetype)shareInstence{
    
    if(me == nil){
        UIStoryboard * storybroad = [UIStoryboard storyboardWithName:@"Iphone" bundle:nil];
        UINavigationController * moduleList = [storybroad instantiateViewControllerWithIdentifier:@"DevListNavigationController"];
        me = [[MySlideMenuController alloc]initWithCenterViewController:moduleList];
        MenuViewController *menuView = [storybroad instantiateViewControllerWithIdentifier:@"MenuViewController"];
        me.leftViewController = menuView;
        me.slideOffset =[UIScreen mainScreen].applicationFrame.size.width/4;
    }
    return me;
}

- (instancetype)init
{
    self = [super initWithCenterViewController:nil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
