//
//  UIColor+Addons.h
//  XJ_Letter
//
//  Created by apple on 2017/11/23.
//  Copyright © 2017年 ZhangJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Addons)
#pragma mark - HexColors

+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

- (NSString *)hexValues;
@end
