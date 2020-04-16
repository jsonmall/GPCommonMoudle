//
//  DTCustomTransparentNavView.m
//  DrivingTest
//
//  Created by 郭大侠 on 2018/12/20.
//  Copyright © 2018年 eclicks. All rights reserved.
//

#import "DTCustomTransparentNavView.h"
#import "UIImage+Utils.h"
#import "UIColor+util.h"
#import "UIButton+Utils.h"
#define XZGpCommonModule @"ZGpNewCommon"


@interface DTCustomTransparentNavView ()

@property (nonatomic, assign) CGFloat offset;

@property (nonatomic, strong) UIImageView *line;


@end
//封装没有完全健壮，慎用

@implementation DTCustomTransparentNavView

- (instancetype)initWithFrame:(CGRect)frame 
{
    if (self = [super initWithFrame: frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        UINavigationBar *bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT, SCREEN_WIDTH, 44)];
        bar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [bar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
        [bar setShadowImage:[[UIImage alloc] init] ];
        [self addSubview:bar];
     
         
        _line = [[UIImageView alloc] initWithFrame:CGRectMake(0, frame.size.height-1, frame.size.width, 1)];
        _line.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
        _line.backgroundColor = [UIColor clearColor];
        [self addSubview:_line];
        
        UINavigationItem * navItem = [[UINavigationItem alloc] init];
        [bar pushNavigationItem:navItem animated:NO];
        self.navItem = navItem;
        
        UILabel *titleLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
        titleLb.font = [UIFont boldSystemFontOfSize:18];
        titleLb.text = @"";
        titleLb.textAlignment = NSTextAlignmentCenter;
        titleLb.textColor = [UIColor whiteColor];
        navItem.titleView = titleLb;
        _navTitleLabel = titleLb;
        
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.frame = CGRectMake(0, 0, 44, 44);
        [backButton setImage:[UIImage xz_imagePathWithName:@"common_icon_back" bundle:XZGpCommonModule targetClass:[self class]] forState:UIControlStateNormal];

        [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        if (iOS(11)) {
            backButton.contentEdgeInsets =UIEdgeInsetsMake(0, -10,0, 0);
            backButton.imageEdgeInsets =UIEdgeInsetsMake(0, -10,0, 0);
            [backButton setEnlargeEdgeWithTop:0 left:-5 bottom:0 right:0];
        }
        space.width = iOS(11) ? 0:-10;
        navItem.leftBarButtonItems = @[space,backItem];
        self.leftItem = backItem;
        
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
        
        navItem.rightBarButtonItem = rightItem;
        self.rightItem = rightItem;
        self.navbar = bar;
        
    }
    return self;
}

- (BOOL)navNeedShowWithOffset:(CGFloat)offset
{
    self.offset = offset;
    BOOL show = offset > NAV_MY_CONTENTOFF_Y;
    [self navNeedShow:show];
    return show;
}

- (void)navNeedShow:(BOOL)show
{
    UIButton *backBtn = self.leftItem.customView;
    UIButton *rightBtn = self.rightItem.customView;
    if (show == NO) {
        [backBtn setImage:[UIImage xz_imagePathWithName:@"common_icon_back" bundle:XZGpCommonModule targetClass:[self class]] forState:UIControlStateNormal];
        [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _navTitleLabel.textColor = [UIColor whiteColor];
        self.line.backgroundColor = [UIColor clearColor];
        [UIView animateWithDuration:0.6f animations:^{
          self.backgroundColor = [UIColor clearColor];
          [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        } completion:^(BOOL finished) {
        }];
    } else if (show){
        [backBtn setImage:[UIImage xz_imagePathWithName:@"common_icon_back_b" bundle:XZGpCommonModule targetClass:[self class]] forState:UIControlStateNormal];
        [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _navTitleLabel.textColor = [UIColor blackColor];
        self.line.backgroundColor = [UIColor colorWithHexString:@"d9d9d9"];
        [UIView animateWithDuration:0.6f animations:^{
            self.backgroundColor = [UIColor whiteColor];
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        } completion:^(BOOL finished) {
        }];
    }
}

- (void)setAawaysBeBlack
{
    UIButton *backBtn = self.leftItem.customView;
    UIButton *rightBtn = self.rightItem.customView;
    _navTitleLabel.textColor = [UIColor blackColor];
    [backBtn setImage:[UIImage xz_imagePathWithName:@"common_icon_back_b" bundle:XZGpCommonModule targetClass:[self class]] forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.line.backgroundColor = [UIColor colorWithHexString:@"d9d9d9"];
    self.backgroundColor = [UIColor whiteColor];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)setAawaysBeBlackNoneLine
{
    UIButton *backBtn = self.leftItem.customView;
    UIButton *rightBtn = self.rightItem.customView;
    _navTitleLabel.textColor = [UIColor blackColor];
    [backBtn setImage:[UIImage xz_imagePathWithName:@"common_icon_back_b" bundle:XZGpCommonModule targetClass:[self class]] forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.line.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor whiteColor];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)_setInitialOnlyBlackBtnNoneLine
{
    UIButton *backBtn = self.leftItem.customView;
    UIButton *rightBtn = self.rightItem.customView;
    [backBtn setImage:[UIImage xz_imagePathWithName:@"common_icon_back_b" bundle:XZGpCommonModule targetClass:[self class]] forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _navTitleLabel.textColor = [UIColor clearColor];
    self.line.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)setAawaysBeWhite
{
    UIButton *backBtn = self.leftItem.customView;
    UIButton *rightBtn = self.rightItem.customView;
    _navTitleLabel.textColor = [UIColor whiteColor];
    [backBtn setImage:[UIImage  xz_imagePathWithName:@"common_icon_back" bundle:XZGpCommonModule targetClass:[self class]] forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.line.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)setFakeBeWhite
{
    UIButton *backBtn = self.leftItem.customView;
    UIButton *rightBtn = self.rightItem.customView;
    _navTitleLabel.textColor = [UIColor clearColor];
    [backBtn setImage:[UIImage  xz_imagePathWithName:@"common_icon_back_b" bundle:XZGpCommonModule targetClass:[self class]] forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.line.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)backAction
{
    if (self.leftItemBlock) {
        self.leftItemBlock();
    }
}

- (void)rightClick
{
    if (self.rightItemBlock) {
        self.rightItemBlock();
    }
}

@end
