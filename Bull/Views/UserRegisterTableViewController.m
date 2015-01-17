//
//  UserRegisterTableViewController.m
//  Bull
//
//  Created by wangmeng on 15/1/16.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import "UserRegisterTableViewController.h"
#import "VIewUtil.h"
#import "UIViewController+AlertShow.h"
#import "UserManger.h"

@interface UserRegisterTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *fristPswd;
@property (weak, nonatomic) IBOutlet UITextField *secondPswd;

@end

@implementation UserRegisterTableViewController

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
    if(section ==1){
        return 2;
    }
    return 1;
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


-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if([identifier isEqualToString:@"RegistDone"]){
        NSString * username = self.userName.text;
        NSString * pswd1 = self.fristPswd.text;
        NSString * pswd2 = self.fristPswd.text;
        if(![VIewUtil isPhone:username]&&![VIewUtil isEmail:username]){
            [self showAlertWithErrMsg:@"请输入正确的邮箱或者手机"];
            return false;
        }
        
        if(pswd1 == nil || pswd1.length < 6|| pswd1.length >32){
            [self showAlertWithErrMsg:@"密码输入错误 (大于6位小于32位的字符或者数字)"];
            return false;
        }
        
        if(![pswd1 isEqualToString:pswd2]){
            [self showAlertWithErrMsg:@"两次密码输入不同"];
            return false;
        }
        
        if([[UserManger shareInstence] registerByUserName:username pswd:pswd1]){
            [self showAlerWithOKMsg:@"注册成功"];
            return true;
        }else{
            [self showAlertWithErrMsg:@"网络连接失败，或邮箱或手机已被注册"];
            return false;
        }
    }
    return true;
}

@end
