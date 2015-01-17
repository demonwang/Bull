//
//  DMUINavigationController.m
//  Bull
//
//  Created by wangmeng on 15/1/14.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import "DMUINavigationController.h"

@interface DMUINavigationController ()

@end

@implementation DMUINavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setBarTintColor:[UIColor colorWithRed:0x51/255.0 green:0xBC/255.0 blue:0x19/255.0 alpha:0xFF/255.0]];
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
