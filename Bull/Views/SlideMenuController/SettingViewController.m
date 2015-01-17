//
//  SettingViewController.m
//  Bull
//
//  Created by wangmeng on 15/1/13.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import "SettingViewController.h"
#import "VIewUtil.h"
#import "SecretDecodeTableViewController.h"

@interface SettingViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *secertNumSwich;
@property (weak, nonatomic) IBOutlet UISwitch *soundSwitch;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.tableView reloadData];
    if([VIewUtil ISLocked]){
        self.secertNumSwich.on = true;
    }else{
        self.secertNumSwich.on = false;
    }
    
    if([VIewUtil isSoundOpen]){
        self.soundSwitch.on = true;
    }else{
        self.soundSwitch.on = false;
    }
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(section == 0){
        if([VIewUtil ISLocked]){
            return 2;
        }
    }
    if(section == 2){
        return 2;
    }
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (IBAction)SecertNumSwicthPressed:(id)sender {
    if(!self.secertNumSwich.on){
        UINavigationController * lockView = [[VIewUtil getMainStoryBoard]instantiateViewControllerWithIdentifier:@"LockNumNavigationController"];
        [self presentViewController:lockView animated:YES completion:nil];
    }else{
        UINavigationController * lockView = [[VIewUtil getMainStoryBoard]instantiateViewControllerWithIdentifier:@"SecertNumSettingTableViewController"];
        [self.navigationController pushViewController:lockView animated:YES];
    }
}
- (IBAction)soundSwitchPressed:(id)sender {
    [VIewUtil setSoundOpen:self.soundSwitch.on];
}

-(IBAction)backFromPush:(UIStoryboardSegue *)segu{
    
}

@end
