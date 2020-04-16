//
//  DTPTableViewConfig.h
//  DTPTableView
//
//  Created by guodaxia on 2018/3/17.
//  Copyright © 2018年 @iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DTPTableViewCellDelegate, DTPTableViewHeaderFooterViewDelegate;

@interface DTPTableViewConfig : NSObject

#pragma mark - propeties

@property (nonatomic, weak) UIViewController *viewController;
@property (nonatomic, weak) id<DTPTableViewCellDelegate> cellDelegate;
@property (nonatomic, weak) id<DTPTableViewHeaderFooterViewDelegate> headerFooterViewDelegate;

#pragma mark - constructor

+ (instancetype)sharedConfig;

@end
