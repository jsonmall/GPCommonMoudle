//
//  StretchableTableHeaderView.h
//  StretchableTableHeaderView
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DTStretchableTableHeaderView : NSObject

@property (nonatomic,strong) UITableView* tableView;
@property (nonatomic,strong) UIView *headerview;
@property (nonatomic, strong)UIImageView *bgImageView;

/**
 * subview:内容部分
 * view   :拉伸的背景图片
 */
- (void)stretchHeaderForTableView:(UITableView*)tableView
                         withBgIMageView:(UIImageView*)bgimageview
                         subViews:(UIView*)headerview;

- (void)stretchHeaderForContainerView:(UIView *)container withBgIMageView:(UIImageView *)bgimageview subViews:(UIView *)headerview tableView:(UITableView *)tableView;


- (void)scrollViewDidScroll:(UIScrollView*)scrollView;

- (void)resizeView;

@end

/*
 *使用时要实现以下两个代理方法
 *- (void)scrollViewDidScroll:(UIScrollView *)scrollView
 *- (void)viewDidLayoutSubviews
*/
