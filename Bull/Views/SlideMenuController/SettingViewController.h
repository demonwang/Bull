//
//  SettingViewController.h
//  Bull
//
//  Created by wangmeng on 15/1/13.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewController.h"
typedef void(^lockedBlock)(BOOL locked);
static lockedBlock mblock;

@interface SettingViewController : BaseTableViewController

@end
