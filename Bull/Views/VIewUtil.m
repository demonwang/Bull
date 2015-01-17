//
//  VIewUtil.m
//  Bull
//
//  Created by wangmeng on 15/1/15.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import "VIewUtil.h"



#define USER_DEF_NAME @"USER_DEF_NAME"
#define USER_DEF_PSWD @"USER_DEF_PSWD"
#define USER_DEF_LOCK_NUM @"USER_DEF_LOCK_NUM"
#define USER_DEF_SOUND_STAT @"USER_DEF_SOUND_STAT"

@implementation VIewUtil




+(BOOL)ISLogined{
    NSString * userName =  [[NSUserDefaults standardUserDefaults] stringForKey:USER_DEF_NAME];
    NSString * userPswd = [[NSUserDefaults standardUserDefaults] stringForKey:USER_DEF_PSWD];
    
    if(userName != nil && userPswd != nil){
        return true;
    }
    return false;
}


+(void)setLogined:(NSString * )userName pasw:(NSString * )pswd{
    if(pswd == nil){
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:USER_DEF_PSWD];
    }else if(userName != nil){
        [[NSUserDefaults standardUserDefaults]setObject:userName forKey:USER_DEF_NAME];
        [[NSUserDefaults standardUserDefaults]setObject:pswd forKey:USER_DEF_PSWD];
    }
}

+(NSString *)getUserPswd{
    return [[NSUserDefaults standardUserDefaults] stringForKey:USER_DEF_PSWD];
}

+(NSString *)getUserName{
    return [[NSUserDefaults standardUserDefaults] stringForKey:USER_DEF_NAME];
}

+(BOOL)ISLocked{
    
    NSString * lockNum = [[NSUserDefaults standardUserDefaults] stringForKey:USER_DEF_LOCK_NUM];
    
    if(lockNum != nil && lockNum.length > 4&& lockNum.length < 9){
        return true;
    }
    return false;
}


+(void)setLocked:(NSString *)lockNum{
    if(lockNum == nil){
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:USER_DEF_LOCK_NUM];
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:lockNum forKey:USER_DEF_LOCK_NUM];
    }
}

+(NSString *)getLockCode{

   return [[NSUserDefaults standardUserDefaults] stringForKey:USER_DEF_LOCK_NUM];
}

+(UIStoryboard *)getMainStoryBoard{
    UIStoryboard * storybroad = [UIStoryboard storyboardWithName:@"Iphone" bundle:nil];
    return  storybroad;
}

+(UIStoryboard *)getStoryBroadByName:(NSString *)name{
    UIStoryboard * storybroad = [UIStoryboard storyboardWithName:name bundle:nil];
    return  storybroad;
}

+(BOOL)isPhone:(NSString *) input{
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:input];
}

+(BOOL)isEmail:(NSString *) input{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:input];
}


+(BOOL)isSoundOpen{
    NSNumber *isopen = [[NSUserDefaults standardUserDefaults]objectForKey:USER_DEF_SOUND_STAT];
    return isopen.boolValue;
}
+(void)setSoundOpen:(BOOL)stat{
    [[NSUserDefaults standardUserDefaults]setObject:[[NSNumber alloc] initWithBool:stat] forKey:USER_DEF_SOUND_STAT];
}


@end
