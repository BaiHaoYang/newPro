
#import "NSDate+Extension.h"

@implementation NSDate (Extension)

- (NSString*)returnDateString{
    static NSDateFormatter* formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }

    NSString *dateString = [formatter stringFromDate:self];

    return dateString;
}

+ (NSString *)returnSecond{
    NSDate *date = [NSDate date];
    NSTimeInterval timeStamp= [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%d",(int)timeStamp ];
}

+ (NSString *)dateWithSecond:(NSString *)secondString{
    
    NSString *timeStamp2 = secondString;
    NSTimeInterval time = [timeStamp2 doubleValue]-28800;
    NSString *timeStr = [NSString stringWithFormat:@"%f",time];
    long long int date1 = (long long int)[timeStr intValue];
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:date1];
    //创建一个格式化器
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    //设置格式化的格式  2014年12月26日
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString * dateString = [dateFormatter stringFromDate:date2];


    return dateString;
}
+ (NSString *)dateWithYMDHM:(NSTimeInterval)time{
    long long int date1 = time;
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:date1];
    //创建一个格式化器
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    //设置格式化的格式  2014年12月26日
    [dateFormatter setDateFormat:@"yyyy:MM:dd HH:mm"];
    NSString * dateString = [dateFormatter stringFromDate:date2];
    
    return dateString;
}
// yyyy-MM-dd
+ (NSString *)timeStringWithDataTimeToDate:(NSTimeInterval)time
{
    NSDateFormatter *dateFormatter = nil;
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"YYYY_MM_dd_hh_mm_ss_SSS"];
    }
    NSString *string = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:(time)]];
    return string;
    
    
}
//////
+ (NSString *)timeStringWithDataTime:(NSTimeInterval)time
{
     NSTimeInterval timeInt = time -28800;
    NSDateFormatter *dateFormatter = nil;
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    }
    NSString *string = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:(timeInt)]];
    return string;
}
+ (NSString *)timeStringWithInterval:(NSTimeInterval)time{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    long int distance = time - a;
    NSString *string;
    if (distance < 1){//avoid 0 seconds
        string = @"已开奖";
    }else if (distance < 60) {
        string = [NSString stringWithFormat:@"%ld秒后开奖", (distance)];
    }else if (distance < 3600) {//60 * 60
        distance = distance / 60;
        string = [NSString stringWithFormat:@"%ld分钟后开奖", (distance)];
    }else if (distance < 86400) {//60 * 60 * 24
        distance = distance / 3600;
        string = [NSString stringWithFormat:@"%ld小时后开奖", (distance)];
    }else if (distance < 2592000) {//60 * 60 * 24 * 7
        distance = distance / 86400;
        string = [NSString stringWithFormat:@"%ld天后开奖", (distance)];
    }
//    else if (distance < 2419200) {//60 * 60 * 24 * 7 * 4
//        distance = distance / 604800;
//        string = [NSString stringWithFormat:@"%ld周前", (distance)];
//    }else if (distance < 31104000) { // 60 * 60 * 24 * 30 * 12
//        distance = distance / 2592000;
//        string = [NSString stringWithFormat:@"%ld月前", (distance)];
//    }
    else {
        NSDateFormatter *dateFormatter = nil;
        if (dateFormatter == nil) {
            dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        }
        string = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:(time)]];
        
    }
    return string;
}
@end
