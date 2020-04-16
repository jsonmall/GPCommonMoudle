//
//  UITableView+DTPTableView.h
//  DTPTableView
//
//  Created by guodaxia on 2018/9/6.
//  Copyright © 2018年 @iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DTPTableViewItem.h"
#import "DTPTableViewSection.h"
#import "DTPTableViewDataSource.h"
#import "DTPTableViewCell.h"
#import "DTPTableViewHeaderFooterView.h"

#define DTPTableViewDeprecated(instead) DEPRECATED_MSG_ATTRIBUTE(" Use '" # instead "' instead")

@interface UITableView (DTPTableView)

#pragma mark - propeties

@property (nonatomic, weak) UIViewController *DTP_viewController;

@property (nonatomic, weak) id<DTPTableViewCellDelegate> DTP_cellDelegate;
@property (nonatomic, weak) id<DTPTableViewHeaderFooterViewDelegate> DTP_headerFooterViewDelegate;

#pragma mark - constructor

+ (instancetype)DTP_tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style dataSource:(DTPTableViewDataSource *)dataSource;

+ (instancetype)DTP_tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style;

#pragma mark - tools
- (void)DTP_creatDataSource;
- (void)DTP_configDataSource:(DTPTableViewDataSource *)dataSource;

- (void)DTP_cellSelectedCallbackWithIndexPath:(NSIndexPath *)indexPath;
- (void)DTP_cellDeselectedCallbackWithIndexPath:(NSIndexPath *)indexPath;

- (DTPTableViewItem *)DTP_itemAtIndexPath:(NSIndexPath *)indexPath;
- (DTPTableViewItem *)DTP_itemAtSection:(NSUInteger)section row:(NSUInteger)row;
- (NSArray<DTPTableViewItem *> *)DTP_itemsAtSection:(NSUInteger)section;

- (void)DTP_addItem:(id)item atSection:(NSUInteger)section;
- (void)DTP_addItems:(NSArray *)items atSection:(NSUInteger)section;
- (void)DTP_insertItem:(id)item atSection:(NSUInteger)section row:(NSUInteger)row;
- (void)DTP_insertItem:(id)item atIndexPath:(NSIndexPath *)indexPath;
- (void)DTP_removeItem:(id)item atSection:(NSUInteger)section;
- (void)DTP_removeItemAtSection:(NSUInteger)section row:(NSUInteger)row;
- (void)DTP_removeItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)DTP_removeAllItemAtSection:(NSUInteger)section;
- (NSUInteger)DTP_itemsCountAtSection:(NSUInteger)section;

- (NSArray<DTPTableViewSection *> *)DTP_allSections;
- (DTPTableViewSection *)DTP_sectionAtIndex:(NSUInteger)index;
- (void)DTP_addSection:(DTPTableViewSection *)section;
- (void)DTP_addSections:(NSArray<DTPTableViewSection *> *)sections;
- (void)DTP_insertSection:(DTPTableViewSection *)section atIndex:(NSUInteger)index;
- (void)DTP_removeSectionAtIndex:(NSUInteger)section;
- (void)DTP_removeAllSections;
- (NSUInteger)DTP_sectionsCount;

- (void)DTP_cancelHoverWithScrollview:(UIScrollView *)scollview andSectionHeight:(CGFloat)height;

#pragma mark - operation animation
- (void)DTP_insertSectionsAtEmptyTableView:(NSUInteger)sectionsCount withRowAnimation:(UITableViewRowAnimation)animation;

- (void)DTP_insertSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)DTP_deleteSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)DTP_reloadSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)DTP_insertRows:(NSUInteger)rowsCount atEmptySection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)DTP_insertRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)DTP_insertRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)DTP_insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

- (void)DTP_deleteRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)DTP_deleteRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)DTP_deleteRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

- (void)DTP_deleteAllRowsAtSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)DTP_reloadRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)DTP_reloadRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)DTP_reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

#pragma mark - register

- (void)DTP_registerCellNibClass:(Class)nibClass;

- (void)DTP_registerCellClass:(Class)cellClass;

- (void)DTP_registerHeaderFooterViewClass:(Class)registerClass;

- (void)DTP_registerHeaderFooterViewNibClass:(Class)registerNibClass;

@end

#pragma mark - ------------ Deprecated V0.1.0 ------------

@interface UITableView (DTPTableViewDeprecatedV010)

#pragma mark - propeties

@property (nonatomic, weak) UIViewController *viewController DTPTableViewDeprecated(DTP_viewController);

@property (nonatomic, weak) id<DTPTableViewCellDelegate> cellDelegate DTPTableViewDeprecated(DTP_cellDelegate);
@property (nonatomic, weak) id<DTPTableViewHeaderFooterViewDelegate> headerFooterViewDelegate DTPTableViewDeprecated(DTP_headerFooterViewDelegate);

#pragma mark - constructor

+ (instancetype)tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style dataSource:(DTPTableViewDataSource *)dataSource DTPTableViewDeprecated(DTP_tableViewWithFrame:style:dataSource);

+ (instancetype)tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style DTPTableViewDeprecated(DTP_tableViewWithFrame:style:);

#pragma mark - tools
- (void)creatDataSource DTPTableViewDeprecated(DTP_creatDataSource);
- (void)configDataSource:(DTPTableViewDataSource *)dataSource DTPTableViewDeprecated(DTP_configDataSource);

- (void)cellSelectedCallbackWithIndexPath:(NSIndexPath *)indexPath DTPTableViewDeprecated(DTP_cellSelectedCallbackWithIndexPath:);
- (void)cellDeselectedCallbackWithIndexPath:(NSIndexPath *)indexPath DTPTableViewDeprecated(DTP_cellDeselectedCallbackWithIndexPath:);

- (DTPTableViewItem *)itemAtIndexPath:(NSIndexPath *)indexPath DTPTableViewDeprecated(DTP_itemAtIndexPath:);
- (DTPTableViewItem *)itemAtSection:(NSUInteger)section row:(NSUInteger)row DTPTableViewDeprecated(DTP_itemAtSection:row:);
- (NSArray<DTPTableViewItem *> *)itemsAtSection:(NSUInteger)section DTPTableViewDeprecated(DTP_itemsAtSection:);

- (void)addItem:(id)item atSection:(NSUInteger)section DTPTableViewDeprecated(DTP_addItem:atSection:);
- (void)addItems:(NSArray *)items atSection:(NSUInteger)section DTPTableViewDeprecated(DTP_addItems:atSection:);
- (void)insertItem:(id)item atSection:(NSUInteger)section row:(NSUInteger)row DTPTableViewDeprecated(DTP_insertItem:atSection:row:);
- (void)insertItem:(id)item atIndexPath:(NSIndexPath *)indexPath DTPTableViewDeprecated(DTP_insertItem:atIndexPath:);
- (void)removeItem:(id)item atSection:(NSUInteger)section DTPTableViewDeprecated(DTP_removeItem:atSection:);
- (void)removeItemAtSection:(NSUInteger)section row:(NSUInteger)row DTPTableViewDeprecated(DTP_removeItemAtSection:row:);
- (void)removeItemAtIndexPath:(NSIndexPath *)indexPath DTPTableViewDeprecated(DTP_removeItemAtIndexPath:);
- (void)removeAllItemAtSection:(NSUInteger)section DTPTableViewDeprecated(DTP_removeAllItemAtSection:);
- (NSUInteger)itemsCountAtSection:(NSUInteger)section DTPTableViewDeprecated(DTP_itemsCountAtSection:);

- (DTPTableViewSection *)sectionAtIndex:(NSUInteger)index DTPTableViewDeprecated(DTP_sectionAtIndex:);
- (void)addSection:(DTPTableViewSection *)section DTPTableViewDeprecated(DTP_addSection:);
- (void)addSections:(NSArray<DTPTableViewSection *> *)sections DTPTableViewDeprecated(DTP_addSections:);
- (void)insertSection:(DTPTableViewSection *)section atIndex:(NSUInteger)index DTPTableViewDeprecated(DTP_insertSection:atIndex:);
- (void)removeSectionAtIndex:(NSUInteger)section DTPTableViewDeprecated(DTP_removeSectionAtIndex:);
- (void)removeAllSections DTPTableViewDeprecated(DTP_removeAllSections);
- (NSUInteger)sectionsCount DTPTableViewDeprecated(DTP_sectionsCount);

#pragma mark - operation animation
- (void)insertSectionsAtEmptyTableView:(NSUInteger)sectionsCount withRowAnimation:(UITableViewRowAnimation)animation DTPTableViewDeprecated(DTP_insertSectionsAtEmptyTableView:withRowAnimation:);

- (void)insertSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation DTPTableViewDeprecated(DTP_insertSection:withRowAnimation:);

- (void)deleteSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation DTPTableViewDeprecated(DTP_deleteSection:withRowAnimation:);

- (void)reloadSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation DTPTableViewDeprecated(DTP_reloadSection:withRowAnimation:);

- (void)insertRows:(NSUInteger)rowsCount atEmptySection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation DTPTableViewDeprecated(DTP_insertRows:atEmptySection:withRowAnimation:);

- (void)insertRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation DTPTableViewDeprecated(DTP_insertRows:atSection:withRowAnimation:);

- (void)insertRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation DTPTableViewDeprecated(DTP_insertRow:atSection:withRowAnimation:);

- (void)insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation DTPTableViewDeprecated(DTP_insertRowAtIndexPath:withRowAnimation:);

- (void)deleteRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation DTPTableViewDeprecated(DTP_deleteRows:atSection:withRowAnimation:);

- (void)deleteRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation DTPTableViewDeprecated(DTP_deleteRow:atSection:withRowAnimation:);

- (void)deleteRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation DTPTableViewDeprecated(DTP_deleteRowAtIndexPath:withRowAnimation:);

- (void)deleteAllRowsAtSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation DTPTableViewDeprecated(DTP_deleteAllRowsAtSection:withRowAnimation:);

- (void)reloadRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation DTPTableViewDeprecated(DTP_reloadRows:atSection:withRowAnimation:);

- (void)reloadRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation DTPTableViewDeprecated(DTP_reloadRow:atSection:withRowAnimation:);

- (void)reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation DTPTableViewDeprecated(DTP_reloadRowAtIndexPath:withRowAnimation:);

#pragma mark - register

- (void)registerCellNibClass:(Class)nibClass DTPTableViewDeprecated(DTP_registerCellNibClass:);

- (void)registerCellClass:(Class)cellClass DTPTableViewDeprecated(DTP_registerCellClass:);

- (void)registerHeaderFooterViewClass:(Class)registerClass DTPTableViewDeprecated(DTP_registerHeaderFooterViewClass:);

- (void)registerHeaderFooterViewNibClass:(Class)registerNibClass DTPTableViewDeprecated(DTP_registerHeaderFooterViewNibClass:);

@end
