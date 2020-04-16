//
//  DTPTableViewDataSource.h
//  DTPTableView
//
//  Created by guodaxia on 2018/9/6.
//  Copyright © 2018年 @iMac. All rights reserved.
//
#import <UIKit/UIKit.h>

@class DTPTableViewSection,DTPTableViewItem;

@interface DTPTableViewDataSource : NSObject<UITableViewDataSource>

#pragma mark - useful method

- (DTPTableViewItem *)itemAtIndexPath:(NSIndexPath *)indexPath;
- (DTPTableViewItem *)itemAtSection:(NSUInteger)section row:(NSUInteger)row;
- (NSArray<DTPTableViewItem *> *)itemsAtSection:(NSUInteger)section;

- (void)addItem:(id)item atSection:(NSUInteger)section;
- (void)addItems:(NSArray *)items atSection:(NSUInteger)section;
- (void)insertItem:(id)item atSection:(NSUInteger)section row:(NSUInteger)row;
- (void)insertItem:(id)item atIndexPath:(NSIndexPath *)indexPath;
- (void)removeItem:(id)item atSection:(NSUInteger)section;
- (void)removeItemAtSection:(NSUInteger)section row:(NSUInteger)row;
- (void)removeItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)removeAllItemAtSection:(NSUInteger)section;
- (NSInteger)itemsCountAtSection:(NSUInteger)section;

- (NSArray<DTPTableViewSection *> *)allSections;
- (DTPTableViewSection *)sectionAtIndex:(NSUInteger)index;
- (void)addSection:(DTPTableViewSection *)section;
- (void)addSections:(NSArray<DTPTableViewSection *> *)sections;
- (void)insertSection:(DTPTableViewSection *)section atIndex:(NSUInteger)index;
- (void)removeSectionAtIndex:(NSUInteger)section;
- (void)removeAllSections;
- (NSUInteger)sectionsCount;

@end
