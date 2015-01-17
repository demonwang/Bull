//
//  DeviceManager.m
//  Bull
//
//  Created by wangmeng on 15/1/15.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import "DeviceManager.h"

static DeviceManager * me = nil;
@implementation DeviceManager

+(instancetype)shareInstence{
    if(me == nil){
        me = [[DeviceManager alloc]init];
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
@end
