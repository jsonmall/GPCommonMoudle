//
//  DTCustomTransparentNavView.h
//  DrivingTest
//
//  Created by 郭大侠 on 2018/12/20.
//  Copyright © 2018年 eclicks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XZGPCommonTool.h"
#define NAV_MY_CONTENTOFF_Y (60-([XZGPCommonTool isIPhoneX]?(STATUSBAR_HEIGHT - 20):0))
#define SCREEN_WIDTH        (CGRectGetWidth([UIScreen mainScreen].bounds))
#define SCREEN_HEIGHT       (CGRectGetHeight([UIScreen mainScreen].bounds))
#define SCREEN_SCALECOM     (SCREEN_WIDTH/375 > 2 ? 2:SCREEN_WIDTH/375)
#define SCREEN_SCALE        ([UIScreen mainScreen].scale)
#define SCREEN_SIZE         ([[UIScreen mainScreen] currentMode].size)
#define STATUSBAR_HEIGHT    ([XZGPCommonTool isIPhoneX] ? 44.f : 20.f)
#define STYTEM_VERSION_ARRAY    ([[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."])
#define STYTEM_VERSION_HEADER   ([STYTEM_VERSION_ARRAY count]>0?([STYTEM_VERSION_ARRAY[0] intValue]):0)
#define iOS(n)                  (STYTEM_VERSION_HEADER>=n)

typedef void (^ItemBlock) (void);

@interface DTCustomTransparentNavView : UIView

@property (nonatomic, strong)  UINavigationBar *navbar;

@property (nonatomic, strong) UIBarButtonItem *leftItem;

@property (nonatomic, strong) UIBarButtonItem *rightItem;

@property (nonatomic, strong) UINavigationItem * navItem;

@property (nonatomic, strong) UILabel *navTitleLabel;

@property (nonatomic, copy) void(^leftItemBlock)(void);

@property (nonatomic, copy) void(^rightItemBlock)(void);


- (BOOL)navNeedShowWithOffset:(CGFloat)offset;

- (void)navNeedShow:(BOOL)show;

- (void)setAawaysBeBlack;
- (void)setAawaysBeWhite;
- (void)setFakeBeWhite;

- (void)setAawaysBeBlackNoneLine;
- (void)_setInitialOnlyBlackBtnNoneLine;
@end
