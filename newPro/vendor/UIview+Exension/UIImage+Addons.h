//
//  UIImage+Addons.h
//  XJ_Letter
//
//  Created by apple on 2017/11/23.
//  Copyright © 2017年 ZhangJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Addons)
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)imageWithColor:(UIColor *)color strokeColor:(UIColor *)strokeColor size:(CGSize)size;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size radius:(CGFloat)radius;
+ (UIImage *)imageWithColor:(UIColor *)color strokeColor:(UIColor *)strokeColor size:(CGSize)size radius:(CGFloat)radius;
+ (UIImage *)imageWithColor:(UIColor *)color
                strokeColor:(UIColor *)strokeColor
                       size:(CGSize)size
               roundCorners:(UIRectCorner)corners
                      radii:(CGSize)radii;

+ (UIImage *)imageInMainBundleNamed:(NSString *)name;
+ (UIImage *)resizeImage:(UIImage*)image newSize:(CGSize)newSize;

- (UIImage *)grayImage;

- (UIImage *)cropWithRect:(CGRect)rect;

//将图像按一定的规则生成更大的图像，不缩放。主要用来合并背景色和背景图
- (UIImage *)imageInNewSize:(CGSize)newSize edgaeInsets:(UIEdgeInsets)edgeInsets backgroundColor:(UIColor *)backgroundColor;

- (UIImage *)resizable;

+ (UIImage *)imageWithView:(UIView *)view;

+ (UIImage *)imageWithView:(UIView *)view size:(CGSize)size;

/*!
 旋转图片
 @param degrees 旋转角度 转化成angle: degrees * M_PI / 180
 @return 返回旋转后的图片
 */
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

/*!
 将图片裁剪为圆形并返回
 @param radius 所化圆的最大半径
 @return 裁剪后的圆形图片
 备注：图片裁剪，以图片长、宽的最小值作为圆直径进行裁剪
 当得到的半径值大于设定的最大半径值，则采用最大半径值作为半径，否则以获取获取的半径为准
 */
- (UIImage *)imageClippedInCircleWithMaxRadius:(CGFloat)radius;
@end
