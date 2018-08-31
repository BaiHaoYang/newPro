
#import <Foundation/Foundation.h>

@interface NSDate (Extension)

/**
 *  将当前日期转化为日期字符串
 *
 *  @return 日期字符串
 */
- (NSString*)returnDateString;

/**
 *  当前日期转换为时间戳 (日期转换为秒数)
 *
 *  @return 返回时间戳字符串
 */
+ (NSString *)returnSecond;

/**
 *   时间戳转化日期字符串
 *
 *  @param secondString 时间戳
 *
 *  @return 返回一个日期字符串
 */
+ (NSString *)dateWithSecond:(NSString *)secondString;

/**
 *  指定的时间戳距离今天多久(包括时分秒)
 *
 *  @param time 时间戳
 *
 *  @return 字符串
 */
+ (NSString *)timeStringWithInterval:(NSTimeInterval)time;
+ (NSString *)timeStringWithDataTime:(NSTimeInterval)time;
+ (NSString *)timeStringWithDataTimeToDate:(NSTimeInterval)time;
+ (NSString *)dateWithYMDHM:(NSTimeInterval)time;
@end
