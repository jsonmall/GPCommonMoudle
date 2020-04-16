//
//  UITableView+DTPTableView.m
//  DTPTableView
//
//  Created by guodaxia on 2018/9/6.
//  Copyright © 2018年 @iMac. All rights reserved.
//

#import "UITableView+DTPTableView.h"
#import "DTPTableViewConfig.h"

#import <objc/runtime.h>

static char kDTPTableViewDataSourceIdentifyKey;

@interface UITableView()

@property (strong, nonatomic) DTPTableViewDataSource *DTP_dataSource;

@end

@implementation UITableView (DTPTableView)

#pragma mark - hook

#pragma mark - setter and getter
- (void)setDTP_dataSource:(DTPTableViewDataSource *)DTP_dataSource
{
    objc_setAssociatedObject(self, &kDTPTableViewDataSourceIdentifyKey, DTP_dataSource, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    self.dataSource = DTP_dataSource;
}

- (DTPTableViewDataSource *)DTP_dataSource
{
    return objc_getAssociatedObject(self, &kDTPTableViewDataSourceIdentifyKey);
}

- (UIViewController *)DTP_viewController
{
    return [DTPTableViewConfig sharedConfig].viewController;
}

- (void)setDTP_viewController:(UIViewController *)viewController
{
    [DTPTableViewConfig sharedConfig].viewController = viewController;
}

- (void)setDTP_cellDelegate:(id<DTPTableViewCellDelegate>)cellDelegate
{
    [DTPTableViewConfig sharedConfig].cellDelegate = cellDelegate;
}

- (id<DTPTableViewCellDelegate>)DTP_cellDelegate
{
    return [DTPTableViewConfig sharedConfig].cellDelegate;
}

- (void)setDTP_headerFooterViewDelegate:(id<DTPTableViewHeaderFooterViewDelegate>)headerFooterViewDelegate
{
    [DTPTableViewConfig sharedConfig].headerFooterViewDelegate = headerFooterViewDelegate;
}

- (id<DTPTableViewHeaderFooterViewDelegate>)DTP_headerFooterViewDelegate
{
    return [DTPTableViewConfig sharedConfig].headerFooterViewDelegate;
}

#pragma mark - constructor method.
+ (instancetype)DTP_tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style dataSource:(DTPTableViewDataSource *)dataSource
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:style];
    
    if (dataSource) {
        [tableView DTP_configDataSource:dataSource];
    } else {
        [tableView DTP_creatDataSource];
    }
    
    return tableView;
}

+ (instancetype)DTP_tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    return [UITableView DTP_tableViewWithFrame:frame style:style dataSource:nil];
}

#pragma mark - tools
- (void)DTP_configDataSource:(DTPTableViewDataSource *)dataSource
{
    self.DTP_dataSource = dataSource;
}

- (void)DTP_creatDataSource
{
    DTPTableViewDataSource *dataSource = [[DTPTableViewDataSource alloc] init];
    
    [self DTP_configDataSource:dataSource];
}

- (void)DTP_cellSelectedCallbackWithIndexPath:(NSIndexPath *)indexPath
{
    [(DTPTableViewCell *)[self cellForRowAtIndexPath:indexPath] selectedEvent];
}

- (void)DTP_cellDeselectedCallbackWithIndexPath:(NSIndexPath *)indexPath
{
    [(DTPTableViewCell *)[self cellForRowAtIndexPath:indexPath] deselectedEvent];
}

- (DTPTableViewItem *)DTP_itemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.DTP_dataSource itemAtIndexPath:indexPath];
}

- (DTPTableViewItem *)DTP_itemAtSection:(NSUInteger)section row:(NSUInteger)row
{
    return [self.DTP_dataSource itemAtSection:section row:row];
}

- (NSArray<DTPTableViewItem *> *)DTP_itemsAtSection:(NSUInteger)section
{
    return [self.DTP_dataSource itemsAtSection:section];
}

- (void)DTP_addItem:(id)item atSection:(NSUInteger)section
{
    [self.DTP_dataSource addItem:item atSection:section];
}

- (void)DTP_addItems:(NSArray *)items atSection:(NSUInteger)section
{
    [self.DTP_dataSource addItems:items atSection:section];
}

- (void)DTP_insertItem:(id)item atSection:(NSUInteger)section row:(NSUInteger)row
{
    [self.DTP_dataSource insertItem:item atSection:section row:row];
}

- (void)DTP_insertItem:(id)item atIndexPath:(NSIndexPath *)indexPath
{
    [self.DTP_dataSource insertItem:item atIndexPath:indexPath];
}

- (void)DTP_removeItem:(id)item atSection:(NSUInteger)section
{
    [self.DTP_dataSource removeItem:item atSection:section];
}

- (void)DTP_removeItemAtSection:(NSUInteger)section row:(NSUInteger)row
{
    [self.DTP_dataSource removeItemAtSection:section row:row];
}

- (void)DTP_removeItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.DTP_dataSource removeItemAtIndexPath:indexPath];
}

- (void)DTP_removeAllItemAtSection:(NSUInteger)section
{
    [self.DTP_dataSource removeAllItemAtSection:section];
}

- (NSUInteger)DTP_itemsCountAtSection:(NSUInteger)section
{
    return [self.DTP_dataSource itemsCountAtSection:section];
}

- (void)DTP_addSection:(DTPTableViewSection *)section
{
    [self.DTP_dataSource addSection:section];
}

- (void)DTP_addSections:(NSArray<DTPTableViewSection *> *)sections
{
    [self.DTP_dataSource addSections:sections];
}

- (void)DTP_insertSection:(DTPTableViewSection *)section atIndex:(NSUInteger)index
{
    [self.DTP_dataSource insertSection:section atIndex:index];
}

- (NSArray<DTPTableViewSection *> *)DTP_allSections
{
    return [self.DTP_dataSource allSections];
}

- (DTPTableViewSection *)DTP_sectionAtIndex:(NSUInteger)index
{
    return [self.DTP_dataSource sectionAtIndex:index];
}

- (void)DTP_removeSectionAtIndex:(NSUInteger)index
{
    [self.DTP_dataSource removeSectionAtIndex:index];
}

- (void)DTP_removeAllSections
{
    [self.DTP_dataSource removeAllSections];
}

- (NSUInteger)DTP_sectionsCount
{
    return [self.DTP_dataSource sectionsCount];
}

- (void)DTP_cancelHoverWithScrollview:(UIScrollView *)scollview andSectionHeight:(CGFloat)height
{
    if (scollview.contentOffset.y<=height && scollview.contentOffset.y>=0) {
        scollview.contentInset = UIEdgeInsetsMake(-scollview.contentOffset.y, 0, 0, 0);
    } else if (scollview.contentOffset.y>=height) {
        scollview.contentInset = UIEdgeInsetsMake(-height, 0, 0, 0);
    }
}
#pragma mark - operation animation

- (void)DTP_insertSectionsAtEmptyTableView:(NSUInteger)sectionsCount withRowAnimation:(UITableViewRowAnimation)animation
{
    [self insertSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, sectionsCount)] withRowAnimation:animation];
}

- (void)DTP_insertSection:(NSUInteger)sectionIndex withRowAnimation:(UITableViewRowAnimation)animation
{
    [self insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:animation];
}

- (void)DTP_deleteSection:(NSUInteger)sectionIndex withRowAnimation:(UITableViewRowAnimation)animation
{
    [self deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:animation];
}

- (void)DTP_reloadSection:(NSUInteger)sectionIndex withRowAnimation:(UITableViewRowAnimation)animation
{
    [self reloadSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:animation];
}

- (NSArray *)DTP_indexPathsWithRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section
{
    NSMutableArray *indexPaths = [NSMutableArray array];
    for (NSNumber *row in rows) {
        [indexPaths addObject:[NSIndexPath indexPathForItem:row.unsignedIntegerValue inSection:section]];
    }
    
    return indexPaths;
}

- (void)DTP_insertRows:(NSUInteger)rowsCount atEmptySection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    NSMutableArray *indexPaths = [NSMutableArray array];
    for (int i = 0; i < rowsCount; i++) {
        [indexPaths addObject:[NSIndexPath indexPathForItem:i inSection:section]];
    }
    [self insertRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)DTP_insertRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    NSArray *indexPaths = [self DTP_indexPathsWithRows:rows atSection:section];
    
    [self insertRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)DTP_insertRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self DTP_insertRows:@[@(row)] atSection:section withRowAnimation:animation];
}

- (void)DTP_insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation
{
    [self insertRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

- (void)DTP_reloadRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    NSArray *indexPaths = [self DTP_indexPathsWithRows:rows atSection:section];

    [self reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)DTP_reloadRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self DTP_reloadRows:@[@(row)] atSection:section withRowAnimation:animation];
}

- (void)DTP_reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation
{
    [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

- (void)DTP_deleteRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    NSArray *indexPaths = [self DTP_indexPathsWithRows:rows atSection:section];
    
    [self deleteRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)DTP_deleteRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self DTP_deleteRows:@[@(row)] atSection:section withRowAnimation:animation];
}

- (void)DTP_deleteAllRowsAtSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    NSMutableArray *indexPaths = [NSMutableArray array];
    
    for (int i = 0; i < [self DTP_itemsCountAtSection:section]; i++) {
        
        [indexPaths addObject:[NSIndexPath indexPathForItem:i inSection:section]];
    }
    
    [self deleteRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)DTP_deleteRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation
{
    [self deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

#pragma mark - register cell
- (void)DTP_registerCellNibClass:(Class)nibClass
{
    [[nibClass class] registerNibToTableView:self];
}

- (void)DTP_registerCellClass:(Class)cellClass
{
    [[cellClass class] registerClassToTableView:self];
}

- (void)DTP_registerHeaderFooterViewClass:(Class)registerClass
{
    [[registerClass class] registerClassToTableView:self];
}

- (void)DTP_registerHeaderFooterViewNibClass:(Class)registerNibClass
{
    [[registerNibClass class] registerNibToTableView:self];
}

@end


#pragma mark - ------------ Deprecated V0.1.0 ------------

@implementation UITableView (DTPTableViewDeprecatedV010)

#pragma mark - setter and getter

- (UIViewController *)viewController
{
    return self.DTP_viewController;
}

- (void)setViewController:(UIViewController *)viewController
{
    self.DTP_viewController = viewController;
}

- (void)setCellDelegate:(id<DTPTableViewCellDelegate>)cellDelegate
{
    self.DTP_cellDelegate = cellDelegate;
}

- (id<DTPTableViewCellDelegate>)cellDelegate
{
    return self.DTP_cellDelegate;
}

- (void)setHeaderFooterViewDelegate:(id<DTPTableViewHeaderFooterViewDelegate>)headerFooterViewDelegate
{
    self.DTP_headerFooterViewDelegate = headerFooterViewDelegate;
}

- (id<DTPTableViewHeaderFooterViewDelegate>)headerFooterViewDelegate
{
    return self.DTP_headerFooterViewDelegate;
}

#pragma mark - constructor method.
+ (instancetype)tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style dataSource:(DTPTableViewDataSource *)dataSource
{
    return [UITableView DTP_tableViewWithFrame:frame style:style dataSource:dataSource];
}

+ (instancetype)tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    return [UITableView DTP_tableViewWithFrame:frame style:style];
}

#pragma mark - tools
- (void)configDataSource:(DTPTableViewDataSource *)dataSource
{
    [self DTP_configDataSource:dataSource];
}

- (void)creatDataSource
{
    [self DTP_creatDataSource];
}

- (void)cellSelectedCallbackWithIndexPath:(NSIndexPath *)indexPath
{
    [self DTP_cellSelectedCallbackWithIndexPath:indexPath];
}

- (void)cellDeselectedCallbackWithIndexPath:(NSIndexPath *)indexPath
{
    [self DTP_cellDeselectedCallbackWithIndexPath:indexPath];
}

- (DTPTableViewItem *)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self DTP_itemAtIndexPath:indexPath];
}

- (DTPTableViewItem *)itemAtSection:(NSUInteger)section row:(NSUInteger)row
{
    return [self DTP_itemAtSection:section row:row];
}

- (NSArray<DTPTableViewItem *> *)itemsAtSection:(NSUInteger)section
{
    return [self DTP_itemsAtSection:section];
}

- (void)addItem:(id)item atSection:(NSUInteger)section
{
    [self DTP_addItem:item atSection:section];
}

- (void)addItems:(NSArray *)items atSection:(NSUInteger)section
{
    [self DTP_addItems:items atSection:section];
}

- (void)insertItem:(id)item atSection:(NSUInteger)section row:(NSUInteger)row
{
    [self DTP_insertItem:item atSection:section row:row];
}

- (void)insertItem:(id)item atIndexPath:(NSIndexPath *)indexPath
{
    [self DTP_insertItem:item atIndexPath:indexPath];
}

- (void)removeItem:(id)item atSection:(NSUInteger)section
{
    [self DTP_removeItem:item atSection:section];
}

- (void)removeItemAtSection:(NSUInteger)section row:(NSUInteger)row
{
    [self DTP_removeItemAtSection:section row:row];
}

- (void)removeItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self DTP_removeItemAtIndexPath:indexPath];
}

- (void)removeAllItemAtSection:(NSUInteger)section
{
    [self DTP_removeAllItemAtSection:section];
}

- (NSUInteger)itemsCountAtSection:(NSUInteger)section
{
    return [self DTP_itemsCountAtSection:section];
}

- (void)addSection:(DTPTableViewSection *)section
{
    [self DTP_addSection:section];
}

- (void)addSections:(NSArray<DTPTableViewSection *> *)sections
{
    [self DTP_addSections:sections];
}

- (void)insertSection:(DTPTableViewSection *)section atIndex:(NSUInteger)index
{
    [self DTP_insertSection:section atIndex:index];
}

- (DTPTableViewSection *)sectionAtIndex:(NSUInteger)index
{
    return [self DTP_sectionAtIndex:index];
}

- (void)removeSectionAtIndex:(NSUInteger)index
{
    [self DTP_removeSectionAtIndex:index];
}

- (void)removeAllSections
{
    [self DTP_removeAllSections];
}

- (NSUInteger)sectionsCount
{
    return [self DTP_sectionsCount];
}

#pragma mark - operation animation

- (void)insertSectionsAtEmptyTableView:(NSUInteger)sectionsCount withRowAnimation:(UITableViewRowAnimation)animation
{
    [self DTP_insertSectionsAtEmptyTableView:sectionsCount withRowAnimation:animation];
}

- (void)insertSection:(NSUInteger)sectionIndex withRowAnimation:(UITableViewRowAnimation)animation
{
    [self DTP_insertSection:sectionIndex withRowAnimation:animation];
}

- (void)deleteSection:(NSUInteger)sectionIndex withRowAnimation:(UITableViewRowAnimation)animation
{
    [self DTP_deleteSection:sectionIndex withRowAnimation:animation];
}

- (void)reloadSection:(NSUInteger)sectionIndex withRowAnimation:(UITableViewRowAnimation)animation
{
    [self DTP_reloadSection:sectionIndex withRowAnimation:animation];
}

- (void)insertRows:(NSUInteger)rowsCount atEmptySection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self DTP_insertRows:rowsCount atEmptySection:section withRowAnimation:animation];
}

- (void)insertRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self DTP_insertRows:rows atSection:section withRowAnimation:animation];
}

- (void)insertRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self DTP_insertRow:row atSection:section withRowAnimation:animation];
}

- (void)insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation
{
    [self DTP_insertRowAtIndexPath:indexPath withRowAnimation:animation];
}

- (void)reloadRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self DTP_reloadRows:rows atSection:section withRowAnimation:animation];
}

- (void)reloadRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self DTP_reloadRow:row atSection:section withRowAnimation:animation];
}

- (void)reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation
{
    [self DTP_reloadRowAtIndexPath:indexPath withRowAnimation:animation];
}

- (void)deleteRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self DTP_deleteRows:rows atSection:section withRowAnimation:animation];
}

- (void)deleteRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self DTP_deleteRow:row atSection:section withRowAnimation:animation];
}

- (void)deleteAllRowsAtSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self DTP_deleteAllRowsAtSection:section withRowAnimation:animation];
}

- (void)deleteRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation
{
    [self DTP_deleteRowAtIndexPath:indexPath withRowAnimation:animation];
}

#pragma mark - register cell
- (void)registerCellNibClass:(Class)nibClass
{
    [self DTP_registerCellNibClass:nibClass];
}

- (void)registerCellClass:(Class)cellClass
{
    [self DTP_registerCellClass:cellClass];
}

- (void)registerHeaderFooterViewClass:(Class)registerClass
{
    [self DTP_registerHeaderFooterViewClass:registerClass];
}

- (void)registerHeaderFooterViewNibClass:(Class)registerNibClass
{
    [self DTP_registerHeaderFooterViewNibClass:registerNibClass];
}

@end
