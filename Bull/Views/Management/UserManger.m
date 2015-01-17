//
//  UserManger.m
//  Bull
//
//  Created by wangmeng on 15/1/15.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import "UserManger.h"


static UserManger * me = nil;
@implementation UserManger
+(instancetype)shareInstence{
    if(me == nil){
        me = [[UserManger alloc]init];
    }
    return me;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(BOOL)LoginByUserName:(NSString * )userName pswd:(NSString *)pswd{
    return  true;
}
-(BOOL)LoginByDefInfo{
    return true;
}

-(BOOL)findPswdByUserPhone:(NSString *)userPhone{
    return true;
}
-(BOOL)findPswdByUserEmail:(NSString *)userEmail{
    return true;
}

-(BOOL)registerByUserName:(NSString *)username pswd:(NSString * )pswd{
    return false;
}

-(BOOL)setUser:(UserInfo *)user{
    [user saveData];
    return true;
}

-(BOOL)changePswdByOldPswd:(NSString *)old newPswd:(NSString *)newpswd{
    return true;
}
@end
