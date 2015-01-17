//
//  DMDrawerController.m
//  Bull
//
//  Created by wangmeng on 15/1/14.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import "DMDrawerController.h"
#import "MenuViewController.h"
#import "VIewUtil.h"


static DMDrawerController * me = nil;
static BOOL OSVersionIsAtLeastiOS7();


@interface DMDrawerController ()
    
@end

@implementation DMDrawerController


+(instancetype)shareInstence{
    if(me == nil){
        me = [[DMDrawerController alloc]init];
    }
    return me;
}

-(instancetype)init{
    UIStoryboard * storybroad = [UIStoryboard storyboardWithName:@"Iphone" bundle:nil];
    
    MenuViewController *menuView = [storybroad instantiateViewControllerWithIdentifier:@"MenuViewController"];
    UINavigationController * moduleList = [storybroad instantiateViewControllerWithIdentifier:@"DevListNavigationController"];
    self = [[DMDrawerController alloc] initWithCenterViewController:moduleList leftDrawerViewController:menuView];
    
    if(self){
        [self setShowsShadow:YES];
    //        if(OSVersionIsAtLeastiOS7()){
    //
    //
    //        }
    //        else{
    //            self.drawerController = [[MMDrawerController alloc]
    //                                     initWithCenterViewController:navigationController
    //                                     leftDrawerViewController:leftSideDrawerViewController
    //                                     rightDrawerViewController:rightSideDrawerViewController];
    //        }
    //        [me setRestorationIdentifier:@""];
    [self setMaximumLeftDrawerWidth:240.0];
    
    
    [self setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    [self setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    [self setGestureCompletionBlock:^(MMDrawerController *drawerController, UIGestureRecognizer *gesture) {
        if(drawerController.openSide == MMDrawerSideLeft){
            [drawerController.centerViewController viewDidDisappear:YES];
            [menuView viewDidAppear:YES];
        }else{
            [drawerController.centerViewController viewDidAppear:YES];
            [menuView viewDidDisappear:YES];
        }
        }];
    }
    me = self;
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

-(void)showLockView{
    UINavigationController * lockView = [[VIewUtil getMainStoryBoard]instantiateViewControllerWithIdentifier:@"LockNumNavigationController"];
    [self presentViewController:lockView animated:YES completion:nil];
}

static BOOL OSVersionIsAtLeastiOS7() {
    return (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1);
}
@end
