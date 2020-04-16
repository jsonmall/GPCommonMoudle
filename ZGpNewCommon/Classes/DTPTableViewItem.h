//
//  DTPTableViewItem.h
//  DTPTableView
//
//  Created by guodaxia on 2018/9/6.
//  Copyright © 2018年 @iMac. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface DTPTableViewItem : NSObject

#pragma mark - propeties

@property (nonatomic, strong) id data;

@property (nonatomic, copy) NSString *cellReuseIdentifier;

@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, assign) CGFloat cellWidth;
@property (nonatomic, assign) NSInteger cellType;

#pragma mark - constructor

+ (DTPTableViewItem *)itemWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                             data:(id)data cellHeight:(CGFloat)cellHeight;


+ (DTPTableViewItem *)itemWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                             data:(id)data
                                       cellHeight:(CGFloat)cellHeight
                                        cellWidth:(CGFloat)cellWidth
                                         cellType:(NSInteger)cellType;

+ (DTPTableViewItem *)itemWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                             data:(id)data
                                       cellHeight:(CGFloat)cellHeight
                                         cellType:(NSInteger)cellType;

+ (DTPTableViewItem *)itemWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                             data:(id)data
                                         cellType:(NSInteger)cellType;

+ (DTPTableViewItem *)itemWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                             data:(id)data;

@end
