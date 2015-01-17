//
//  UserInfoViewController.m
//  Bull
//
//  Created by wangmeng on 15/1/13.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import "UserInfoViewController.h"
#import "UserInfo.h"
#import "VIewUtil.h"
#import "UserManger.h"

@interface UserInfoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbUserName;
@property (weak, nonatomic) IBOutlet UILabel *lbUserPhone;
@property (weak, nonatomic) IBOutlet UILabel *lbUserEmail;
@property (weak, nonatomic) IBOutlet UILabel *lbUserDevice;

@end

@implementation UserInfoViewController{
    UserInfo * user;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    user = [[[UserInfo alloc]init]loadData];
    
    self.lbUserEmail.text = user.userEmail;
    self.lbUserName.text = user.userDisplayName;
    self.lbUserPhone.text = user.userPhone;
    self.lbUserDevice.text = [[UIDevice currentDevice]name];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)logoutPressed:(id)sender {
    
    if([[UserManger shareInstence]logout]){
        [VIewUtil setLogined:nil pasw:nil];
    }
    
    UIViewController * login = [[VIewUtil getMainStoryBoard] instantiateViewControllerWithIdentifier:@"LoginView"];
    [self presentViewController:login animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if(section == 0){
        return 3;
    }else if(section == 1){
        return 1;
    }else if(section == 2){
        return 1;
    }
    return 0;
}



//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    UIStoryboard * storybroad = [UIStoryboard storyboardWithName:@"Iphone" bundle:nil];
//    switch (indexPath.section) {
//        case 0:
//            if(indexPath.row == 0){
//                UINavigationController *en = [storybroad instantiateViewControllerWithIdentifier:@"ReNameNavigationController"];
//                [self presentViewController:en animated:YES completion:nil];
//            }else if(indexPath.row == 1){
//                UINavigationController *en = [storybroad instantiateViewControllerWithIdentifier:@"ReNameNavigationController"];
//                [self presentViewController:en animated:YES completion:nil];
//            }else if(indexPath.row == 2){
//                UINavigationController *en = [storybroad instantiateViewControllerWithIdentifier:@"ReNameNavigationController"];
//                [self presentViewController:en animated:YES completion:nil];
//            }
//            break;
//        case 1:
//            break;
//        case 2:
//           
//            break;
//        default:
//            break;
//    }
//}




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

@end
