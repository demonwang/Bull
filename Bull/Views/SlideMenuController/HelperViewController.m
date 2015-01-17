//
//  HelperViewController.m
//  Bull
//
//  Created by wangmeng on 15/1/13.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import "HelperViewController.h"

@interface HelperViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *helperWebView;

@end

@implementation HelperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSURL * url = [NSURL URLWithString:@"http://www.gn-smart.cn/help/F0002C0005/index.html"];
    NSURLRequest * request = [[NSURLRequest alloc]initWithURL:url];
    [_helperWebView loadRequest:request];
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
