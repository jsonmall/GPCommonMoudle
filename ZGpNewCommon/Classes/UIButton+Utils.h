//
//  UIButton+Utils.h
//  XZGpCommon
//
//  Created by Gordon on 2020/3/1.
//


#import <objc/runtime.h>

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Utils)

/**扩大按钮响应区域**/
- (void)setEnlargeEdgeWithTop:(CGFloat) top left:(CGFloat) left bottom:(CGFloat) bottom right:(CGFloat) right;

@end

NS_ASSUME_NONNULL_END
