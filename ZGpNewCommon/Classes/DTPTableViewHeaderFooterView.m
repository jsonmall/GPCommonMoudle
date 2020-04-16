//
//  DTPTableViewHeaderFooterView.m
//  DTPTableView
//
//  Created by guodaxia on 2018/9/6.
//  Copyright © 2018年 @iMac. All rights reserved.
//

#import "DTPTableViewHeaderFooterView.h"
#import "DTPTableViewDataSource.h"
#import "DTPTableViewSection.h"

#import "DTPTableViewConfig.h"

@interface DTPTableViewHeaderFooterView ()

@property (nonatomic, strong) UIView *bggroudView;

@end

@implementation DTPTableViewHeaderFooterView

#pragma mark - initialization

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        [self setupBaseConfig];
    }
    
    return self;
}


#pragma mark - constructor method.

+ (instancetype)headerViewWithTableView:(UITableView *)tableView atSection:(NSInteger)section
{
    DTPTableViewDataSource *dataSource = tableView.dataSource;
    DTPTableViewSection *sectionData = [dataSource sectionAtIndex:section];
    DTPTableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sectionData.headerViewIdentifier];
    if (headerView==nil) {
        headerView = [[DTPTableViewHeaderFooterView alloc]initWithReuseIdentifier:sectionData.headerViewIdentifier];
    }
    headerView.tableView = tableView;
    headerView.data = sectionData.sectionHeaderData;
    headerView.section = section;
    
    [headerView loadContent];
    
    return headerView;
}

+ (instancetype)footerViewWithTableView:(UITableView *)tableView atSection:(NSInteger)section
{
    DTPTableViewDataSource *dataSource = tableView.dataSource;
    DTPTableViewSection *sectionData = [dataSource sectionAtIndex:section];
    DTPTableViewHeaderFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sectionData.footerViewIdentifier];
    
    footerView.tableView = tableView;
    footerView.data = sectionData.sectionFooterData;
    footerView.section = section;
    
    [footerView loadContent];
    
    return footerView;
}

+ (CGFloat)heightForHeaderInTableView:(UITableView *)tableView section:(NSUInteger)section
{
    DTPTableViewDataSource *dataSource = tableView.dataSource;
    DTPTableViewSection *sectionData = [dataSource sectionAtIndex:section];
    return sectionData.sectionHeaderHeight;
}

+ (CGFloat)heightForFooterInTableView:(UITableView *)tableView section:(NSUInteger)section
{
    DTPTableViewDataSource *dataSource = tableView.dataSource;
    DTPTableViewSection *sectionData = [dataSource sectionAtIndex:section];
    
    return sectionData.sectionFooterHeight;
}

#pragma mark - setter and getter

- (void)setHeaderFooterViewBackgroundColor:(UIColor *)headerFooterViewBackgroundColor
{
    _headerFooterViewBackgroundColor = headerFooterViewBackgroundColor;
    
    [self.bggroudView setBackgroundColor:headerFooterViewBackgroundColor];
}

#pragma mark - setup

- (void)setupBaseConfig
{
    self.viewController = [DTPTableViewConfig sharedConfig].viewController;
    self.delegate = [DTPTableViewConfig sharedConfig].headerFooterViewDelegate;
    
    [self setupHeaderFooterView];
    [self buildSubview];
}

#pragma mark - subclass overwrite

- (void)setupHeaderFooterView {
    
}

- (void)buildSubview {
    [self.contentView addSubview:self.bggroudView];
}

- (void)loadContent {
    
}

- (UIView *)bggroudView
{
    if (!_bggroudView) {
        _bggroudView = [[UIView alloc]initWithFrame:self.bounds];
        _bggroudView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _bggroudView.backgroundColor = [UIColor redColor];
    }
        return _bggroudView;
}

#pragma mark - register tools

+ (void)registerClassToTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier {
    
    NSString *identifier = reuseIdentifier.length <= 0 ? NSStringFromClass([self class]) : reuseIdentifier;
    [tableView registerClass:[self class] forHeaderFooterViewReuseIdentifier:identifier];
}

+ (void)registerNibToTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier {
    
    NSString *identifier = reuseIdentifier.length <= 0 ? NSStringFromClass([self class]) : reuseIdentifier;
    
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forHeaderFooterViewReuseIdentifier:identifier];
}

+ (void)registerClassToTableView:(UITableView *)tableView {
    
    [tableView registerClass:[self class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([self class])];
}

+ (void)registerNibToTableView:(UITableView *)tableView {
    
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forHeaderFooterViewReuseIdentifier:NSStringFromClass([self class])];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
