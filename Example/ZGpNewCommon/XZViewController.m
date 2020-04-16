//
//  XZViewController.m
//  XZGpCommon
//
//  Created by gordon on 02/28/2020.
//  Copyright (c) 2020 gordon. All rights reserved.
//

#import "XZViewController.h"
#import "DTCustomTransparentNavView.h"

@interface XZViewController ()
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong)DTCustomTransparentNavView  *customNav;
@end

@implementation XZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self tableView];
    [self customNav];
    self.tableView.backgroundColor = [UIColor blackColor];
    NSMutableArray *neq = [NSMutableArray new];
    [neq addObject:nil];
    [neq objectAtIndex:4];
}

- (DTCustomTransparentNavView *)customNav
{
    if (!_customNav) {
        _customNav = [[DTCustomTransparentNavView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,44 + STATUSBAR_HEIGHT)];
        _customNav.navTitleLabel.text = @"分享";
        _customNav.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self.view addSubview:_customNav];
    }
    return _customNav;
}

- (UITableView *)tableView {
    
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
