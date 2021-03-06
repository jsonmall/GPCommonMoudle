//
//  DTPTableViewCell.m
//  DTPTableView
//
//  Created by guodaxia on 2018/9/6.
//  Copyright © 2018年 @iMac. All rights reserved.
//

#import "DTPTableViewCell.h"
#import "DTPTableViewItem.h"
#import "DTPTableViewConfig.h"

@implementation DTPTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setupBaseConfig];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupBaseConfig];
    }
    
    return self;
}


#pragma mark - setup

- (void)setupBaseConfig
{
    self.viewController = [DTPTableViewConfig sharedConfig].viewController;
    self.delegate = [DTPTableViewConfig sharedConfig].cellDelegate;
    
    [self setupCell];
    [self buildSubview];
}

#pragma mark - subclass overwrite
- (void)setupCell {
    
}

- (void)buildSubview {
    
}

- (void)loadContent {
    
}

- (void)selectedEvent {
    
}

- (void)deselectedEvent {
    
}

+ (CGFloat)cellHeightWithData:(id)data {
    return 0.f;
}

#pragma mark - tools
- (void)updateWithHeight:(CGFloat)height animated:(BOOL)animated {
    
    if (_tableView && _cellItem) {
        if (animated) {
            _cellItem.cellHeight = height;
            [_tableView beginUpdates];
            [_tableView endUpdates];
            
        } else {
            _cellItem.cellHeight = height;
            [_tableView reloadData];
        }
    }
}

- (void)setWeakReferenceWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath item:(DTPTableViewItem *)item {
    _tableView = tableView;
    _indexPath = indexPath;
    _cellItem = item;
    _data = item.data;
}

#pragma mark - cell data constructor

+ (DTPTableViewItem *)cellItemWithReuseIdentifier:(NSString *)reuseIdentifier data:(id)data cellHeight:(CGFloat)height type:(NSInteger)type {
    
    NSString *tmpReuseIdentifier = reuseIdentifier.length <= 0 ? NSStringFromClass([self class]) : reuseIdentifier;
    return [DTPTableViewItem itemWithCellReuseIdentifier:tmpReuseIdentifier data:data cellHeight:height cellType:type];
}

+ (DTPTableViewItem *)cellItemWithReuseIdentifier:(NSString *)reuseIdentifier data:(id)data
                                             cellHeight:(CGFloat)height cellWidth:(CGFloat)cellWidth
                                                   type:(NSInteger)type {
    
    NSString *tmpReuseIdentifier = reuseIdentifier.length <= 0 ? NSStringFromClass([self class]) : reuseIdentifier;
    return [DTPTableViewItem itemWithCellReuseIdentifier:tmpReuseIdentifier data:data cellHeight:height cellWidth:cellWidth cellType:type];
}

+ (DTPTableViewItem *)cellItemWithData:(id)data cellHeight:(CGFloat)height type:(NSInteger)type {
    
    return [[self class] cellItemWithReuseIdentifier:nil data:data cellHeight:height type:type];
}

+ (DTPTableViewItem *)cellItemWithData:(id)data cellHeight:(CGFloat)height {
    
    return [[self class] cellItemWithReuseIdentifier:nil data:data cellHeight:height type:0];
}

+ (DTPTableViewItem *)cellItemWithData:(id)data {
    
    return [[self class] cellItemWithReuseIdentifier:nil data:data cellHeight:0 type:0];
}

#pragma mark - register cell tools

+ (void)registerClassToTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier {
    
    [tableView registerClass:[self class] forCellReuseIdentifier:reuseIdentifier];
}

+ (void)registerClassToTableView:(UITableView *)tableView {
    
    [tableView registerClass:[self class] forCellReuseIdentifier:NSStringFromClass([self class])];
}

+ (void)registerNibToTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier {
    
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:reuseIdentifier];
}


+ (void)registerNibToTableView:(UITableView *)tableView {
    
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([self class])];
}


@end
