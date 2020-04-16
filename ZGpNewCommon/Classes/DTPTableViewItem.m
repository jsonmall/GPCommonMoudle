//
//  DTPTableViewItem.m
//  DTPTableView
//
//  Created by guodaxia on 2018/9/6.
//  Copyright © 2018年 @iMac. All rights reserved.
//

#import "DTPTableViewItem.h"

@implementation DTPTableViewItem

#pragma mark - constructor method.

+ (DTPTableViewItem *)itemWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers data:(id)data
                                                 cellHeight:(CGFloat)cellHeight cellWidth:(CGFloat)cellWidth
                                                   cellType:(NSInteger)cellType {
    
    DTPTableViewItem *item    = [[[self class] alloc] init];
    item.cellReuseIdentifier = cellReuseIdentifiers;
    item.data                = data;
    item.cellHeight          = cellHeight;
    item.cellWidth           = cellWidth;
    item.cellType            = cellType;
    
    return item;
}

+ (DTPTableViewItem *)itemWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers data:(id)data cellHeight:(CGFloat)cellHeight
{
    return [[self class] itemWithCellReuseIdentifier:cellReuseIdentifiers data:data cellHeight:cellHeight cellWidth:0 cellType:0];
}
+ (DTPTableViewItem *)itemWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers data:(id)data
                                       cellHeight:(CGFloat)cellHeight cellType:(NSInteger)cellType {
    return [[self class] itemWithCellReuseIdentifier:cellReuseIdentifiers data:data cellHeight:cellHeight cellWidth:0 cellType:cellType];
}

+ (DTPTableViewItem *)itemWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                             data:(id)data
                                         cellType:(NSInteger)cellType
{
    return [[self class] itemWithCellReuseIdentifier:cellReuseIdentifiers data:data cellHeight:0 cellWidth:0 cellType:cellType];
}

+ (DTPTableViewItem *)itemWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                             data:(id)data
{
    return [[self class] itemWithCellReuseIdentifier:cellReuseIdentifiers data:data cellHeight:0 cellWidth:0 cellType:0];
}

@end
