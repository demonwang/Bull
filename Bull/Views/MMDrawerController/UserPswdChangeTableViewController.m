//
//  UserPswdChangeTableViewController.m
//  Bull
//
//  Created by wangmeng on 15/1/14.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import "UserPswdChangeTableViewController.h"
#import "VIewUtil.h"
#import "UIViewController+AlertShow.h"
#import "UserManger.h"

@interface UserPswdChangeTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *oldPswdTF;
@property (weak, nonatomic) IBOutlet UITextField *Pswdone;
@property (weak, nonatomic) IBOutlet UITextField *Pswdtwo;

@end

@implementation UserPswdChangeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if(section == 0){
        return 1;
    }
    return 2;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)ok:(id)sender{
    NSString * old = self.oldPswdTF.text;
    NSString * new1 = self.Pswdone.text;
    NSString * new2 = self.Pswdtwo.text;
    
    if(old == nil || old.length <= 0 ||(![old isEqualToString:[VIewUtil getUserPswd]])){
        [self showAlertWithErrMsg:@"旧密码输入错误"];
        return ;
    }
    
    if(new1 == nil||new2 == nil||new1.length <= 0 || new2.length <= 0 ||(![new1 isEqualToString:new2])){
        [self showAlertWithErrMsg:@"新密码输入错误"];
        return ;
    }
    
    if([[UserManger shareInstence]changePswdByOldPswd:old newPswd:new2]){
        [self dismissViewControllerAnimated:YES completion:nil];
        return ;
    }else{
        [self showAlertWithErrMsg:@"设置密码错误，请检查网络"];
        return;
    }
}

@end
