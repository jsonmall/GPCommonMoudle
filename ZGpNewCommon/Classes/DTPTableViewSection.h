//
//  DTPTableViewSection.h
//  DTPTableView
//
//  Created by guodaxia on 2018/9/6.
//  Copyright © 2018年 @iMac. All rights reserved.
//
#import <UIKit/UIKit.h>

@class DTPTableViewItem;

@interface DTPTableViewSection : NSObject

#pragma mark - propeties.

@property (nonatomic) NSInteger section;

@property (assign, nonatomic) BOOL expend;

@property (nonatomic) CGFloat sectionHeaderHeight;
@property (nonatomic) CGFloat sectionFooterHeight;

@property (nonatomic, strong) NSString *headerViewIdentifier;
@property (nonatomic, strong) NSString *footerViewIdentifier;

@property (nonatomic, strong) id sectionHeaderData;
@property (nonatomic, strong) id sectionFooterData;

#pragma mark - initialization

 - (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithItems:(NSArray *)items cellClass:(Class)cellClass headerClass:(Class)headerClass footerClass:(Class)footerClass  headerData:(id)headerData footerData:(id)footerData headerHeight:(CGFloat)headerHeight footerHeight:(CGFloat)footerHeight NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithItems:(NSArray *)items cellClass:(Class)cellClass headerClass:(Class)headerClass headerData:(id)headerData headerHeight:(CGFloat)headerHeight;

- (instancetype)initWithItems:(NSArray *)items cellClass:(Class)cellClass footerClass:(Class)footerClass footerData:(id)footerData  footerHeight:(CGFloat)footerHeight;

- (instancetype)initWithItems:(NSArray *)items cellClass:(Class)cellClass;

- (instancetype)initWithCellClass:(Class)cellClass;

#pragma mark - tools
- (void)addItem:(id)item;
- (void)addItems:(NSArray *)items;
- (void)insertItem:(id)item atIndex:(NSInteger)index;
- (void)removeItemAtIndex:(NSUInteger)index;
- (void)removeItem:(id)item;
- (void)removeAllItems;

- (DTPTableViewItem *)itemAtIndex:(NSUInteger)index;
- (NSArray<DTPTableViewItem *> *)allItems;

- (NSUInteger)itemsCount;

@end
