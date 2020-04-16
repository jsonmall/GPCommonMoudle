//
//  DTPTableViewCell.h
//  DTPTableView
//
//  Created by guodaxia on 2018/9/6.
//  Copyright © 2018年 @iMac. All rights reserved.
//
#import <UIKit/UIKit.h>
//anathor change
@class DTPTableViewCell, DTPTableViewItem;

@protocol DTPTableViewCellDelegate <NSObject>

@optional

- (void)tableViewCell:(DTPTableViewCell *)cell event:(id)event;

@end

@interface DTPTableViewCell : UITableViewCell

#pragma mark - propeties

@property (nonatomic, weak) id<DTPTableViewCellDelegate> delegate;

@property (nonatomic, weak) DTPTableViewItem *cellItem;

@property (nonatomic, weak) id data;

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, weak) UIViewController *viewController;

@property (nonatomic, strong) NSIndexPath *indexPath;

#pragma mark - override by subclass
- (void)setupCell;

- (void)buildSubview;

- (void)loadContent;

- (void)selectedEvent;

- (void)deselectedEvent;

+ (CGFloat)cellHeightWithData:(id)data;

#pragma mark - useful method

- (void)updateWithHeight:(CGFloat)height animated:(BOOL)animated;

- (void)setWeakReferenceWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath item:(DTPTableViewItem *)item;

#pragma mark - cell data constructor

+ (DTPTableViewItem *)cellItemWithReuseIdentifier:(NSString *)reuseIdentifier data:(id)data cellHeight:(CGFloat)height cellWidth:(CGFloat)cellWidth type:(NSInteger)type;

+ (DTPTableViewItem *)cellItemWithReuseIdentifier:(NSString *)reuseIdentifier data:(id)data cellHeight:(CGFloat)height type:(NSInteger)type;

+ (DTPTableViewItem *)cellItemWithData:(id)data cellHeight:(CGFloat)height type:(NSInteger)type;

+ (DTPTableViewItem *)cellItemWithData:(id)data cellHeight:(CGFloat)height;

+ (DTPTableViewItem *)cellItemWithData:(id)data;

#pragma mark - register

+ (void)registerClassToableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier;

+ (void)registerClassToTableView:(UITableView *)tableView;

+ (void)registerNibToTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier;

+ (void)registerNibToTableView:(UITableView *)tableView;

@end
