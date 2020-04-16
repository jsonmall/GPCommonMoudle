//
//  UIImage+Utils.h
//  FFStory
//
//  Created by PageZhang on 14/11/18.
//  Copyright (c) 2014年 FF. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "UIImage+QRCode.h"

typedef NS_ENUM(NSUInteger, ZGradientType) {
    
    ZGradientTypeTopToBottom = 0,//从上到下
    
    ZGradientTypeLeftToRight = 1,//从左到右
    
    ZGradientTypeUpleftToLowright = 2,//左上到右下
    
    ZGradientTypeUprightToLowleft = 3,//右上到左下
    
};

// 生成一个给定尺寸的空图片
extern UIImage *FFPlaceholderImageWithSize(CGSize size);
extern UIImage *FFPlaceholderImageWithSizeAndColor(CGSize size, UIColor *tintColor);

@interface UIImage (Utils)

/// <#Description#>
/// @param name
///  加载图片
+ (UIImage *)loadWithName:(NSString *)name targetClass:(Class)targetClass;
+ (UIImage *)xz_imagePathWithName:(NSString *)imageName bundle:(NSString *)bundle targetClass:(Class)targetClass;

// 修改图片颜色
- (UIImage *)tintedWithColor:(UIColor *)color;
- (UIImage *)tintedWithColor:(UIColor *)color fraction:(CGFloat)fraction;

// 从图片中截取
- (UIImage *)subImageFromRect:(CGRect)rect;

//将图片转成灰色的图片
- (UIImage *)grayImage;

- (UIImage *)imageWithAlpha:(CGFloat)alpha;
- (UIImage *)addImageToBottom:(UIImage *)image;

@end

@interface UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColorString:(NSString *)string;

//无需size 生成最小圆角 并自动拉伸到合适尺寸
+ (UIImage *)imageWithColorString:(NSString *)string cornerRadius:(CGFloat)radius;
+ (UIImage *)imageWithColor:(UIColor *)color cornerRadius:(CGFloat)radius;

+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;

+ (UIImage *)imageWithSize:(CGSize)size borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius;
+ (UIImage *)imageWithSize:(CGSize)size bgColor:(UIColor *)bgColor borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius;
/**图片渐变色**/
+ (UIImage *)gradientColorImageFromColors:(NSArray*)colors gradientType:(ZGradientType)gradientType imgSize:(CGSize)imgSize;
@end

