//
//  BullTests.m
//  BullTests
//
//  Created by wangmeng on 15/1/12.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "UserInfo.h"

@interface BullTests : XCTestCase

@end

@implementation BullTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    UserInfo* user = [[UserInfo alloc]init];
    user.userPhone = @"123456";
    user.userEmail = @"asfasf@1212.com";
    user.userDisplayName = @"demo";
    user.userName = @"demon";
    [user saveData];
    
    UserInfo * myuser = [[UserInfo alloc]init];
    [myuser loadData];
    NSLog(@" user name %@",myuser.userName);
    NSLog(@" user userPhone %@",myuser.userPhone);
    NSLog(@" user userEmail %@",myuser.userEmail);
    NSLog(@" user userDisplayName %@",myuser.userDisplayName);
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    //XCTAssert(YES, @"Pass");
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
