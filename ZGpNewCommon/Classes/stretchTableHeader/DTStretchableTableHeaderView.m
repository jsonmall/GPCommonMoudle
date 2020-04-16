//
//  StretchableTableHeaderView.m
//  StretchableTableHeaderView
//

#import "DTStretchableTableHeaderView.h"


@interface DTStretchableTableHeaderView()
{
    CGRect initialFrame;
    CGFloat defaultViewHeight;
}
@end


@implementation DTStretchableTableHeaderView

- (void)stretchHeaderForTableView:(UITableView *)tableView withBgIMageView:(UIImageView *)bgimageview subViews:(UIView *)headerview
{
    [_bgImageView removeFromSuperview];
    [_headerview removeFromSuperview];
    
    _tableView = tableView;
    _bgImageView     = bgimageview;
    _headerview = headerview;
    
    initialFrame      = _bgImageView.frame;
    defaultViewHeight  = initialFrame.size.height;
    
    UIView *emptyTableHeaderView = [[UIView alloc] initWithFrame:initialFrame];
    emptyTableHeaderView.userInteractionEnabled = NO;
    emptyTableHeaderView.backgroundColor = [UIColor clearColor];
    _tableView.tableHeaderView = emptyTableHeaderView;
    
    [_tableView addSubview:_bgImageView];
    [_tableView addSubview:_headerview];
}


- (void)stretchHeaderForContainerView:(UIView *)container withBgIMageView:(UIImageView *)bgimageview subViews:(UIView *)headerview tableView:(UITableView *)tableView
{
//    [_bgImageView removeFromSuperview];
//    [_headerview removeFromSuperview];
    
    _tableView = tableView;
    _bgImageView = bgimageview;
    _headerview = headerview;
    
    initialFrame      = _bgImageView.frame;
    defaultViewHeight  = initialFrame.size.height;
    
//    UIView *emptyTableHeaderView = [[UIView alloc] initWithFrame:initialFrame];
//    emptyTableHeaderView.userInteractionEnabled = NO;
//    emptyTableHeaderView.backgroundColor = [UIColor clearColor];
//    _tableView.tableHeaderView = emptyTableHeaderView;
    
    _tableView.tableHeaderView = _headerview;

    // [container addSubview:_bgImageView];
//    [container addSubview:_headerview];
//    [container insertSubview:_headerview atIndex:0];
}

- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@">>>>>>> scrollViewDidScroll offsetY = %f",offsetY);
    if(scrollView.contentOffset.y < 0)
    {
        CGRect rect = _bgImageView.frame;
        rect.origin.y = offsetY;
        rect.size.height = defaultViewHeight - offsetY;
        _bgImageView.frame = rect;
    } else {
        _bgImageView.frame  = initialFrame;
    }
}


- (void)resizeView
{
    initialFrame.size.width = _tableView.frame.size.width;
    _bgImageView.frame = initialFrame;
}


@end
