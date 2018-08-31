//
//  NBATools.h
//  NBAirCleaner
//
//  Created by 白浩洋 on 2018/2/5.
//  Copyright © 2018年 HaoYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NBATools : NSObject
+ (BOOL)iPhoneX;
+ (BOOL)SHState;
+ (void)setSHState:(BOOL)state;
+ (NSInteger)getstar;
+ (void)setVersions:(float)currentVersion;
+ (float)getVersions;
+ (void)setAbout:(NSString*)aboutStr;
+ (NSString*)getAbout;
+ (void)setstar:(NSInteger)star;
+ (void)setstarOnline:(NSInteger)star;
+ (void)sethistory:(NSArray *)histArr;
+ (void)setshoucang:(NSArray *)histArr;
+ (NSArray *)getshoucang;
+ (void)setshenheshoucang:(NSArray *)histArr;
+ (NSArray *)getshenheshoucang;
+ (NSArray *)gethistory;
+ (void)setyuedu:(NSString *)yuedu WithID:(NSString *)id  withTabName:(NSString *)tabName;
//字符串文字的长度
+(CGFloat)widthOfString:(NSString *)string font:(UIFont*)font height:(CGFloat)height;
//字符串文字的高度
+(CGFloat)heightOfString:(NSString *)string font:(UIFont*)font width:(CGFloat)width;
//获取今天的日期：年月日
+(NSDictionary *)getTodayDate;
// 获取 网络状态
+ (NSString *)getNetworkType;
+(void)removeUserDefaultDataWithObjectArr:(NSArray *)arr;
+ (void)setUserInfo:(NSString *)phone withPassword:(NSString *)password;
+ (NSString *)getUserInfo_phone;
+ (NSString *)getUserInfo_password;
+ (void)showSVHUD:(NSString *)String;
+ (void)showSVHUDWithError:(NSString *)failString;
+ (BOOL)isMobileNumber:(NSString *)mobileNum;
+ (BOOL) deptNumInputShouldNumber:(NSString *)str;//判断字符串是否为数字
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
+ (NSString *)getDeviceIDInKeychain;
+ (id)load:(NSString *)service;
+ (void)delete:(NSString *)service;
+ (void)save:(NSString *)service data:(id)data;
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service;
+ (UIAlertController *)showAlert;

@end
