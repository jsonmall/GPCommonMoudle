//
//  DTPTableViewSection.m
//  DTPTableView
//
//  Created by guodaxia on 2018/9/6.
//  Copyright © 2018年 @iMac. All rights reserved.
//

#import "DTPTableViewSection.h"
#import "DTPTableViewItem.h"
#import "DTPTableViewCell.h"
#import "DTPTableViewHeaderFooterView.h"

@interface DTPTableViewSection() {
    Class _cellClass;
    Class _headerViewClass;
    Class _footerViewClass;
}

@property (nonatomic, strong) NSMutableArray<DTPTableViewItem *> *items;

@end


@implementation DTPTableViewSection

#pragma mark - initialization

- (instancetype)initWithItems:(NSArray *)items cellClass:(Class)cellClass headerClass:(Class)headerClass footerClass:(Class)footerClass headerData:(id)headerData footerData:(id)footerData headerHeight:(CGFloat)headerHeight footerHeight:(CGFloat)footerHeight
{
    if (self = [super init]) {
        
        _expend = YES;
        
        _sectionHeaderHeight = headerHeight;
        _sectionFooterHeight = footerHeight;
        
        if (cellClass) {
            NSAssert([[cellClass new] isKindOfClass:[DTPTableViewCell class]], @"invalid cell class, it must be a subclass of DTPTableViewCell");
            
            if ([[cellClass new] isKindOfClass:[DTPTableViewCell class]]) {
                _cellClass = cellClass;
            }
        }
        
        if (headerClass) {
            NSAssert([[headerClass new] isKindOfClass:[DTPTableViewHeaderFooterView class]], @"invalid header view class, it must be a subclass of DTPTableViewHeaderFooterView");
            
            if ([[headerClass new] isKindOfClass:[DTPTableViewHeaderFooterView class]]) {
                _headerViewClass = headerClass;
            }
        }
        
        if (footerClass) {
            NSAssert([[footerClass new] isKindOfClass:[DTPTableViewHeaderFooterView class]], @"invalid footer view class, it must be a subclass of DTPTableViewHeaderFooterView");
            
            if ([[footerClass new] isKindOfClass:[DTPTableViewHeaderFooterView class]]) {
                _footerViewClass = footerClass;
            }
        }
        
        _sectionHeaderData = headerData;
        _sectionFooterData = footerData;
        
        if (items) {
            [self addItems:items];
        }
    }
    
    return self;
}

- (instancetype)initWithItems:(NSArray *)items cellClass:(Class)cellClass headerClass:(Class)headerClass headerData:(id)headerData headerHeight:(CGFloat)headerHeight
{
    return [self initWithItems:items cellClass:cellClass headerClass:headerClass footerClass:nil headerData:headerData footerData:nil headerHeight:headerHeight footerHeight:0];
}

- (instancetype)initWithItems:(NSArray *)items cellClass:(Class)cellClass footerClass:(Class)footerClass footerData:(id)footerData  footerHeight:(CGFloat)footerHeight
{
    return [self initWithItems:items cellClass:cellClass headerClass:nil footerClass:footerClass headerData:nil footerData:footerData headerHeight:0 footerHeight:footerHeight];
}

- (instancetype)initWithItems:(NSArray *)items cellClass:(Class)cellClass
{
    return [self initWithItems:items cellClass:cellClass headerClass:nil footerClass:nil headerData:nil footerData:nil headerHeight:0 footerHeight:0];
}

- (instancetype)initWithCellClass:(Class)cellClass
{
    return [self initWithItems:nil cellClass:cellClass headerClass:nil footerClass:nil headerData:nil footerData:nil headerHeight:0 footerHeight:0];
}

#pragma mark - setter and getter
- (NSMutableArray<DTPTableViewItem *> *)items
{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    
    return _items;
}

- (NSString *)headerViewIdentifier
{
    if (!_headerViewIdentifier) {
        if (_headerViewClass) {
            _headerViewIdentifier = NSStringFromClass(_headerViewClass);
        }
    }
    
    return _headerViewIdentifier;
}

- (NSString *)footerViewIdentifier
{
    if (!_footerViewIdentifier) {
        if (_footerViewClass) {
            _footerViewIdentifier = NSStringFromClass(_footerViewClass);
        }
    }
    
    return _footerViewIdentifier;
}

#pragma mark - tools

- (void)addItem:(id)item
{
    NSAssert(item, @"item can not be nil");

    if (!item) {
        return;
    }
    
    if ([item isKindOfClass:[DTPTableViewItem class]]) {
        [self.items addObject:item];
    } else if (_cellClass) {
        [self.items addObject:[_cellClass cellItemWithData:item]];
    }
}

- (void)addItems:(NSArray *)items
{
    NSAssert(items, @"items can not be nil");

    if (!items) {
        return;
    }
    
    NSMutableArray<DTPTableViewItem *> *dataAdapterItems = [NSMutableArray array];
    
    for (id item in items) {
        if ([item isKindOfClass:[DTPTableViewItem class]]) {
            [dataAdapterItems addObject:item];
        } else if (_cellClass) {
            [dataAdapterItems addObject:[_cellClass cellItemWithData:item]];
        }
    }
    
    [self.items addObjectsFromArray:dataAdapterItems];
}

- (void)removeAllItems
{
    [self.items removeAllObjects];
}

- (void)insertItem:(id)item atIndex:(NSInteger)index
{
    NSAssert(item && self.items.count >= index, @"error item:%@ index:%ld", item, index);

    if (!item || self.items.count < index) {
        return;
    }
    
    if ([item isKindOfClass:[DTPTableViewItem class]]) {
        [self.items insertObject:item atIndex:index];
    } else if (_cellClass) {
        [self.items insertObject:[_cellClass cellItemWithData:item] atIndex:index];
    }
}

- (void)removeItemAtIndex:(NSUInteger)index
{
    NSAssert(self.items.count > index, @"error item index:%ld", index);

    if (self.items.count <= index) {
        return;
    }
    
    [self.items removeObjectAtIndex:index];
}

- (void)removeItem:(id)item
{
    NSAssert(item, @"item can not be nil");
    
    if (!item) {
        return;
    }
    
    if ([item isKindOfClass:[DTPTableViewItem class]]) {
        [self.items removeObject:item];
    } else {
        [self.items enumerateObjectsUsingBlock:^(DTPTableViewItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj.data isEqual:item]) {
                [self.items removeObject:obj];
                *stop = YES;
            }
        }];
    }
}

- (DTPTableViewItem *)itemAtIndex:(NSUInteger)index
{
    NSAssert(self.items.count > index, @"item index '%ld' out of range '0 ~ %ld'", index, self.items.count - 1);

    if (self.items.count <= index) {
        return nil;
    }
    
    return self.items[index];
}

- (NSArray<DTPTableViewItem *> *)allItems
{
    return self.items;
}

- (NSUInteger)itemsCount
{
    return self.items.count;
}

@end
