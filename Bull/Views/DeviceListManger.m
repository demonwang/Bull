//
//  DeviceListManger.m
//  Bull
//
//  Created by wangmeng on 15/1/15.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import "DeviceListManger.h"

static DeviceListManger * me = nil;
@implementation DeviceListManger

+(instancetype)shareInstence{
    if(me == nil){
        me = [[DeviceListManger alloc]init];
    }
    return me;
}
@end
