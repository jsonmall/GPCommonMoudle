//
//  DTPTableViewConfig.m
//  DTPTableView
//
//  Created by guodaxia on 2018/3/17.
//  Copyright © 2018年 @iMac. All rights reserved.
//

#import "DTPTableViewConfig.h"

@implementation DTPTableViewConfig

+ (instancetype)sharedConfig
{
    static DTPTableViewConfig *config = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[DTPTableViewConfig alloc] init];
    });
    
    return config;
}

@end
