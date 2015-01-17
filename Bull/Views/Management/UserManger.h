//
//  UserManger.h
//  Bull
//
//  Created by wangmeng on 15/1/15.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"


@interface UserManger : NSObject

+(instancetype)shareInstence;


-(BOOL)LoginByUserName:(NSString * )userName pswd:(NSString *)pswd;
-(BOOL)LoginByDefInfo;
-(BOOL)findPswdByUserPhone:(NSString *)userPhone;
-(BOOL)findPswdByUserEmail:(NSString *)userEmail;
-(BOOL)registerByUserName:(NSString *)username pswd:(NSString * )pswd;

-(BOOL)setUser:(UserInfo *)user;
-(BOOL)changePswdByOldPswd:(NSString *)old newPswd:(NSString *)newpswd;

@end
