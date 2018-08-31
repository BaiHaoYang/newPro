//
//  UIColor+Extension.h
//  project
//
//  Created by 风华正茂 on 15/12/24.
//  Copyright © 2015年 com.cpse. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIColor (Extension)
/**
 *  颜色转图片
 *
 *  @param color <#color description#>
 *
 *  @return <#return value description#>
 */
+ (UIImage*)imageWithColor:(UIColor*)color;


/**
 *  #号 转换颜色
 *
 *  @param stringToConvert <#stringToConvert description#>
 *
 *  @return <#return value description#>
 */
+(UIColor *)hexStringToColor: (NSString *) str;
@end
