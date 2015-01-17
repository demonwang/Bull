//
//  ViewController+AlertShow.m
//  Bull
//
//  Created by wangmeng on 15/1/15.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import "UIViewController+AlertShow.h"


@implementation UIViewController (AlertShow)

-(void)showAlertWithErrMsg:(NSString *)msg{
    [[[UIAlertView alloc]initWithTitle:@"错误" message:msg delegate:self cancelButtonTitle:@"返回" otherButtonTitles:nil, nil] show];
}

-(void)showAlerWithOKMsg:(NSString *)msg{
    [[[UIAlertView alloc]initWithTitle:@"成功" message:msg delegate:self cancelButtonTitle:@"返回"otherButtonTitles:nil, nil] show];
}
@end
