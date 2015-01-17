//
//  UserInfo.m
//  Bull
//
//  Created by wangmeng on 15/1/16.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import "UserInfo.h"
#define USER_LOCAL_SAVE @"user_local_save"

@implementation UserInfo

@synthesize userDisplayName,userEmail,userPhone,userName;
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.userDisplayName forKey:@"userDisplayName"];
    [aCoder encodeObject:self.userEmail forKey:@"userEmail"];
    [aCoder encodeObject:self.userName forKey:@"userName"];
    [aCoder encodeObject:self.userPhone forKey:@"userPhone"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.userPhone = [aDecoder decodeObjectForKey:@"userPhone"];
        self.userEmail = [aDecoder decodeObjectForKey:@"userEmail"];
        self.userDisplayName = [aDecoder decodeObjectForKey:@"userDisplayName"];
    }
    return self;
}

-(id)loadData{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:@"appData"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        UserInfo * user = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
       // UserInfo * user = [dataDict objectForKey:@"USER_INFO"];
        if(user == nil){
            user = [[UserInfo alloc]init];
        }
        return user;
    }
    return nil;
}
-(void)saveData{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:@"appData"];
    [NSKeyedArchiver archiveRootObject:self toFile:filePath];
}


@end
