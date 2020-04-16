//
//  XZGPCommonTool.m
//  XZGpCommon
//
//  Created by Gordon on 2020/3/1.
//

#import "XZGPCommonTool.h"

@implementation XZGPCommonTool

+ (BOOL)isIPhoneX
{
    if (@available(iOS 11.0, *)) {
        CGFloat bottom = [UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom;
        CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
        if (bottom > 0.f) {
                   return YES;
            }else if (statusBarHeight >=44){
                   return YES;
            }else{
                 return NO;
            }
    }else {
        return NO;
    }
}


@end
