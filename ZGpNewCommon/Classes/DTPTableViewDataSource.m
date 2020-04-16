//
//  DTPTableViewDataSource.m
//  DTPTableView
//
//  Created by guodaxia on 2018/9/6.
//  Copyright © 2018年 @iMac. All rights reserved.
//

#import "DTPTableViewDataSource.h"
#import "DTPTableViewItem.h"
#import "DTPTableViewCell.h"
#import "DTPTableViewSection.h"

@interface DTPTableViewDataSource()

@property (strong, nonatomic) NSMutableArray<DTPTableViewSection *> *sections;

@end

@implementation DTPTableViewDataSource

#pragma mark - setter and getter
- (NSMutableArray<DTPTableViewSection *> *)sections
{
    if (!_sections) {
        _sections = [NSMutableArray array];
    }
    
    return _sections;
}

#pragma mark - tools
- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    NSAssert(self.sections.count > indexPath.section, @"section index '%ld' out of range '0 ~ %ld'", indexPath.section, self.sections.count - 1);

    if (self.sections.count <= indexPath.section) {
        return nil;
    }
    return [self.sections[indexPath.section] itemAtIndex:indexPath.row];
}

- (DTPTableViewItem *)itemAtSection:(NSUInteger)section row:(NSUInteger)row
{
    NSAssert(self.sections.count > section, @"section index '%ld' out of range '0 ~ %ld'", section, self.sections.count - 1);

    if (self.sections.count <= section) {
        return nil;
    }
    
    return [self.sections[section] itemAtIndex:row];
}

- (NSArray<DTPTableViewItem *> *)itemsAtSection:(NSUInteger)section
{
    NSAssert(self.sections.count > section, @"section index '%ld' out of range '0 ~ %ld'", section, self.sections.count - 1);

    if (self.sections.count <= section) {
        return nil;
    }
    
    return [self.sections[section] allItems];
}

- (void)addItem:(id)item atSection:(NSUInteger)section
{
    NSAssert(self.sections.count > section, @"section index '%ld' out of range '0 ~ %ld'", section, self.sections.count - 1);

    if (self.sections.count <= section) {
        return;
    }
    
    [self.sections[section] addItem:item];
}

- (void)addItems:(NSArray *)items atSection:(NSUInteger)section
{
    NSAssert(self.sections.count > section, @"section index '%ld' out of range '0 ~ %ld'", section, self.sections.count - 1);

    if (self.sections.count <= section) {
        return;
    }
    
    [self.sections[section] addItems:items];
}

- (void)insertItem:(id)item atSection:(NSUInteger)section row:(NSUInteger)row
{
    NSAssert(self.sections.count > section, @"section index '%ld' out of range '0 ~ %ld'", section, self.sections.count - 1);

    if (self.sections.count <= section) {
        return;
    }
    
    [self.sections[section] insertItem:item atIndex:row];
}

- (void)insertItem:(id)item atIndexPath:(NSIndexPath *)indexPath
{
    NSAssert(self.sections.count > indexPath.section, @"section index '%ld' out of range '0 ~ %ld'", indexPath.section, self.sections.count - 1);

    if (self.sections.count <= indexPath.section) {
        
        return;
    }
    
    [self.sections[indexPath.section] insertItem:item atIndex:indexPath.row];
}

- (void)removeItem:(id)item atSection:(NSUInteger)section
{
    NSAssert(self.sections.count > section, @"section index '%ld' out of range '0 ~ %ld'", section, self.sections.count - 1);
    
    if (self.sections.count <= section) {
        return;
    }
    
    [self.sections[section] removeItem:item];
}

- (void)removeItemAtSection:(NSUInteger)section row:(NSUInteger)row
{
    NSAssert(self.sections.count > section, @"section index '%ld' out of range '0 ~ %ld'", section, self.sections.count - 1);
    
    if (self.sections.count <= section) {
        return;
    }
    
    [self.sections[section] removeItemAtIndex:row];
}
- (void)removeItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSAssert(self.sections.count > indexPath.section, @"section index '%ld' out of range '0 ~ %ld'", indexPath.section, self.sections.count - 1);

    if (self.sections.count <= indexPath.section) {
        return;
    }
    
    [self.sections[indexPath.section] removeItemAtIndex:indexPath.row];
}

- (void)removeAllItemAtSection:(NSUInteger)section
{
    NSAssert(self.sections.count > section, @"section index '%ld' out of range '0 ~ %ld'", section, self.sections.count - 1);

    if (self.sections.count <= section) {
        return;
    }
    
    [self.sections[section] removeAllItems];
}

- (NSInteger)itemsCountAtSection:(NSUInteger)section
{
    NSAssert(self.sections.count > section, @"section index '%ld' out of range '0 ~ %ld'", section, self.sections.count - 1);

    if (self.sections.count <= section) {
        return 0;
    }
    
    return [self.sections[section] itemsCount];
}

- (void)addSection:(DTPTableViewSection *)section
{
    if (!section) {

        return;
    }
    
    [self.sections addObject:section];
}

- (void)addSections:(NSArray<DTPTableViewSection *> *)sections
{
    NSAssert(sections, @"error sections:%@", sections);

    if (!sections) {
        return;
    }
    
    [self.sections addObjectsFromArray:sections];
}

- (void)insertSection:(DTPTableViewSection *)section atIndex:(NSUInteger)index
{
    NSAssert(section && self.sections.count >= index, @"error section:%@ index:%ld", section, index);

    if (!section || self.sections.count < index) {
        return;
    }
    
    [self.sections insertObject:section atIndex:index];
}

- (NSArray<DTPTableViewSection *> *)allSections
{
    return self.sections;
}

- (DTPTableViewSection *)sectionAtIndex:(NSUInteger)index
{
    NSAssert(self.sections.count > index, @"section index '%ld' out of range '0 ~ %ld'", index, self.sections.count - 1);

    if (self.sections.count <= index) {
        return nil;
    }
    
    return self.sections[index];
}

- (void)removeSectionAtIndex:(NSUInteger)index
{
    NSAssert(self.sections.count > index, @"section index '%ld' out of range '0 ~ %ld'", index, self.sections.count - 1);

    if (self.sections.count <= index) {
        return;
    }
    
    [self.sections removeObjectAtIndex:index];
}

- (void)removeAllSections
{
    [self.sections removeAllObjects];
}

- (NSUInteger)sectionsCount
{
    return self.sections.count;
}

#pragma mark - table view datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    DTPTableViewSection *sectionData = self.sections[section];
    
    return sectionData.expend ? [sectionData itemsCount] : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DTPTableViewItem *item = [self itemAtIndexPath:indexPath];
    
    DTPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:item.cellReuseIdentifier];
    
    [cell setWeakReferenceWithTableView:tableView indexPath:indexPath item:item];
    
    [cell loadContent];
    
    return cell;
}

@end
