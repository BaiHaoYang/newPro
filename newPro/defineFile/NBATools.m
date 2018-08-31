//
//  NBATools.m
//  NBAirCleaner
//
//  Created by 白浩洋 on 2018/2/5.
//  Copyright © 2018年 HaoYang. All rights reserved.
//

#import "NBATools.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import <Security/Security.h>
NSString * const KEY_UDID_INSTEAD = @"com.haoyang.goodchildren";
@implementation NBATools
+ (void)setAbout:(NSString*)aboutStr{
    NSUserDefaults *st = [NSUserDefaults standardUserDefaults];
    [st setObject:aboutStr forKey:@"aboutShow"];
}
+ (NSString*)getAbout{
    NSUserDefaults *st = [NSUserDefaults standardUserDefaults];
    NSString* currentVersion =  [st objectForKey:@"aboutShow"];
    return currentVersion;
}
+ (BOOL)SHState{
    NSUserDefaults *st = [NSUserDefaults standardUserDefaults];
    BOOL state =  [[st objectForKey:@"newv"] boolValue];
    return state;
}
+ (void)setVersions:(float)currentVersion{
    NSUserDefaults *st = [NSUserDefaults standardUserDefaults];
    [st setObject:[NSString stringWithFormat:@"%lf",currentVersion] forKey:@"currentVersion"];
}
+ (float)getVersions{
    NSUserDefaults *st = [NSUserDefaults standardUserDefaults];
    float currentVersion =  [[st objectForKey:@"currentVersion"] floatValue];
    return currentVersion;
}
+ (void)setSHState:(BOOL)state{
    NSUserDefaults *st = [NSUserDefaults standardUserDefaults];
    [st setObject:[NSString stringWithFormat:@"%d",state] forKey:@"newv"];
}
+ (NSInteger)getstar{
    NSUserDefaults *st = [NSUserDefaults standardUserDefaults];
    NSInteger state =  [[st objectForKey:@"starNUM"] integerValue];
    return state;
}

+ (BOOL)iPhoneX {
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGFloat maxHeight = MAX(size.width, size.height);
    return maxHeight == 812;
}

+(CGFloat)widthOfString:(NSString *)string font:(UIFont *)font height:(CGFloat)height
{
    NSDictionary * dict=[NSDictionary dictionaryWithObject: font forKey:NSFontAttributeName];
    CGRect rect=[string boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    return rect.size.width;
}
+(CGFloat)heightOfString:(NSString *)string font:(UIFont *)font width:(CGFloat)width
{
    CGRect bounds;
    NSDictionary * parameterDict=[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    bounds=[string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:parameterDict context:nil];
    return bounds.size.height;
}
#pragma  mark - 获取当天的日期：年月日
+ (NSDictionary *)getTodayDate
{
    //获取今天的日期
    NSDate *today = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = kCFCalendarUnitYear|kCFCalendarUnitMonth|kCFCalendarUnitDay;
    NSDateComponents *components = [calendar components:unit fromDate:today];
    NSString *year = [NSString stringWithFormat:@"%ld", (long)[components year]];
    NSString *month = [NSString stringWithFormat:@"%ld", (long)[components month]];
    NSString *day = [NSString stringWithFormat:@"%ld", (long)[components day]];
    NSMutableDictionary *todayDic = [[NSMutableDictionary alloc] init];
    [todayDic setObject:year forKey:@"year"];
    [todayDic setObject:month forKey:@"month"];
    [todayDic setObject:day forKey:@"day"];
    return todayDic;
}
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

+ (BOOL)isMobileNumber:(NSString *)mobileNum
{

    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9]|7[0-9])\\d{8}$";

    NSString * CM = @"^1(34[0-8]|(3[5-9]|4[1-9]|5[017-9]|8[1-478])\\d)\\d{7}$";

    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";

    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";

    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES)
        || ([regextestphs evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
+ (NSString *)getNetworkType
{
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *subviews = [[[app valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    NSString *network = @"";
    for (id subview in subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            int networkType = [[subview valueForKeyPath:@"dataNetworkType"] intValue];
            switch (networkType) {
                case 0:
                    network = @"NONE";
                    break;
                case 1:
                    network = @"2G";
                    break;
                case 2:
                    network = @"3G";
                    break;
                case 3:
                    network = @"4G";
                    break;
                case 5:
                    network = @"WIFI";
                    break;
                default:
                    break;
            }
        }
    }
    if ([network isEqualToString:@""]) {
        network = @"NO DISPLAY";
    }
    return network;
}
#pragma mark 获取Wifi信息
+ (NSString *)fetchSSIDInfo
{
    NSString *wifiName = nil;
    CFArrayRef wifiInterfaces = CNCopySupportedInterfaces();
    if (!wifiInterfaces)
    {
        return nil;
    }
    
    NSArray *interfaces = (__bridge NSArray *)wifiInterfaces;
    for (NSString *interfaceName in interfaces)
    {
        CFDictionaryRef dictRef = CNCopyCurrentNetworkInfo((__bridge CFStringRef)(interfaceName));
        if (dictRef)
        {
            NSDictionary *networkInfo = (__bridge NSDictionary *)dictRef;
            NSLog(@"network info -> %@", networkInfo);
            wifiName = [networkInfo objectForKey:(__bridge NSString *)kCNNetworkInfoKeySSID];
            //_bssid = [networkInfo objectForKey:(__bridge NSString *)kCNNetworkInfoKeyBSSID];
            CFRelease(dictRef);
        }
    }
    CFRelease(wifiInterfaces);
    return wifiName;
}


+(void)removeUserDefaultDataWithObjectArr:(NSArray *)arr{
    for (NSString *objectKey in arr) {
        if ([objectKey isKindOfClass:[NSString class]]) {
            if([[NSUserDefaults standardUserDefaults] objectForKey:objectKey])
            {
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:objectKey];
            }
        }
    }
}

+ (void)setUserInfo:(NSString *)phone withPassword:(NSString *)password
{
    if(phone && password)
    {
        [[NSUserDefaults standardUserDefaults] setObject:phone forKey:@"user_phone"];
        [[NSUserDefaults standardUserDefaults] setObject:password forKey:@"user_password"];
    }
}

+ (NSString *)getUserInfo_phone
{
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"user_phone"])
    {
        return [[NSUserDefaults standardUserDefaults] objectForKey:@"user_phone"];
    }
    return @"";
}

+ (NSString *)getUserInfo_password
{
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"user_password"])
    {
        return [[NSUserDefaults standardUserDefaults] objectForKey:@"user_password"];
    }
    return @"";
}
+ (BOOL)deptNumInputShouldNumber:(NSString *)str
{
    if (str.length == 0) {
        return NO;
    }
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:str]) {
        return YES;
    }
    return NO;
}
+(NSString *)getDeviceIDInKeychain {
    NSString *getUDIDInKeychain = (NSString *)[NBATools load:KEY_UDID_INSTEAD];
    NSLog(@"从keychain中获取到的 UDID_INSTEAD %@",getUDIDInKeychain);
    if (!getUDIDInKeychain ||[getUDIDInKeychain isEqualToString:@""]||[getUDIDInKeychain isKindOfClass:[NSNull class]]) {
        CFUUIDRef puuid = CFUUIDCreate( nil );
        CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
        NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
        CFRelease(puuid);
        CFRelease(uuidString);
        NSLog(@"\n \n \n _____重新存储 UUID _____\n \n \n  %@",result);
        [NBATools save:KEY_UDID_INSTEAD data:result];
        getUDIDInKeychain = (NSString *)[NBATools load:KEY_UDID_INSTEAD];
        return @"first";
    }else{
         return getUDIDInKeychain;
    }
    return @"first";
}
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (id)kSecClassGenericPassword,(id)kSecClass,
            service, (id)kSecAttrService,
            service, (id)kSecAttrAccount,
            (id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible,
            nil];
}
+ (void)save:(NSString *)service data:(id)data {
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Delete old item before add new item
    SecItemDelete((CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
}
+ (id)load:(NSString *)service {
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Configure the search setting
    //Since in our simple case we are expecting only a single attribute to be returned (the password) we can set the attribute kSecReturnData to kCFBooleanTrue
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", service, e);
        } @finally {
        }
    }
    if (keyData)
        CFRelease(keyData);
    return ret;
}
+ (void)delete:(NSString *)service {
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((CFDictionaryRef)keychainQuery);
}
+ (UIAlertController *)showAlert {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"温馨提示"
                                                                   message:@"剩余星星不足,不能继续观看了😭,请联系客服充值后再来观看吧"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"联系客服" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              NSURL *url = [NSURL URLWithString:@"mqq://im/chat?chat_type=wpa&uin=2471573973&version=1&src_type=web"];
                                                              BOOL hasInstalled = [[UIApplication sharedApplication] canOpenURL:url];
//                                                              if (!hasInstalled) {
//                                                                  [SVProgressHUD showInfoWithStatus:@"您没有安装QQ，请安装后联系客服充值"];
//                                                                  [SVProgressHUD dismissWithDelay:5];
//                                                              } else {
//                                                                  [[UIApplication sharedApplication] openURL:url];
//                                                              }
                                                          }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"算了" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             
                                                         }];
    [alert addAction:cancelAction];
    [alert addAction:defaultAction];
    return alert;

}
@end
