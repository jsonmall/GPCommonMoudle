//
//  DTPTableViewHeaderFooterView.h
//  DTPTableView
//
//  Created by guodaxia on 2018/9/6.
//  Copyright © 2018年 @iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DTPTableViewHeaderFooterView;

@protocol DTPTableViewHeaderFooterViewDelegate <NSObject>

@optional
- (void)tableViewHeaderFooterView:(DTPTableViewHeaderFooterView *)headerFooterView event:(id)event;

@end

@interface DTPTableViewHeaderFooterView : UITableViewHeaderFooterView

#pragma mark - propeties

@property (nonatomic, weak) id <DTPTableViewHeaderFooterViewDelegate> delegate;

@property (nonatomic, weak) id data;

@property (nonatomic, assign) NSInteger section;

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, weak) UIViewController *viewController;

@property (strong, nonatomic) UIColor *headerFooterViewBackgroundColor;

#pragma mark - register

+ (void)registerClassToTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier;
+ (void)registerNibToTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier;

+ (void)registerClassToTableView:(UITableView *)tableView;
+ (void)registerNibToTableView:(UITableView *)tableView;

#pragma mark - constructor

+ (instancetype)headerViewWithTableView:(UITableView *)tableView atSection:(NSInteger)section;
+ (instancetype)footerViewWithTableView:(UITableView *)tableView atSection:(NSInteger)section;

+ (CGFloat)heightForHeaderInTableView:(UITableView *)tableView section:(NSUInteger)section;
+ (CGFloat)heightForFooterInTableView:(UITableView *)tableView section:(NSUInteger)section;

#pragma mark - override by subclass
- (void)setupHeaderFooterView;

- (void)buildSubview;

- (void)loadContent;

@end
