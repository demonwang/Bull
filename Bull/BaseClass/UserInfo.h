//
//  UserInfo.h
//  Bull
//
//  Created by wangmeng on 15/1/16.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject<NSCoding>
@property (nonatomic)  NSString * userName;
@property (nonatomic) NSString * userPhone;
@property (nonatomic) NSString * userEmail;
@property (nonatomic)  NSString * userDisplayName;

-(id)loadData;
-(void)saveData;
@end
