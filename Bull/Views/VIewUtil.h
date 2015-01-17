//
//  VIewUtil.h
//  Bull
//
//  Created by wangmeng on 15/1/15.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VIewUtil : NSObject
+(BOOL)ISLogined;
+(void)setLogined:(NSString * )userName pasw:(NSString * )pswd;
+(NSString *)getUserName;
+(NSString *)getUserPswd;
+(BOOL)ISLocked;
+(void)setLocked:(NSString *)lockNum;
+(NSString *)getLockCode;
+(UIStoryboard *)getMainStoryBoard;
+(UIStoryboard *)getStoryBroadByName:(NSString *)name;


+(BOOL)isPhone:(NSString *) input;
+(BOOL)isEmail:(NSString *) input;


+(BOOL)isSoundOpen;
+(void)setSoundOpen:(BOOL)stat;
@end
