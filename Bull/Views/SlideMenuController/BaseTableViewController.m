//
//  BaseTableViewController.m
//  Bull
//
//  Created by wangmeng on 15/1/13.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    _isShow = true;
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    _isShow = false;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}


-(IBAction)menuPressed:(id)sender{
    if(self.isShow)
    {
        [[DMDrawerController shareInstence] openDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL isFinished){
            if(isFinished){
                [self viewDidDisappear:YES];
            }
        }];
    }else{
        [[DMDrawerController shareInstence] closeDrawerAnimated:YES completion:^(BOOL isFinished){
            if(isFinished){
                [self viewDidAppear:YES];
            }
        }];
    }
}

@end
