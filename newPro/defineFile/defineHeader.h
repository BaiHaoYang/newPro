//
//  defineHeader.h
//  movie
//
//  Created by 白浩洋 on 2018/3/13.
//  Copyright © 2018年 白浩洋. All rights reserved.

// leanclound  https://leancloud.cn/dashboard/applist.html#/apps   QQ登录   BHYbhy19920901

//

#ifndef defineHeader_h
#define defineHeader_h


#define Version 10201

#define kFont_MainWithSize(fontSize) [UIFont fontWithName:@"PingFangSC-Medium" size:fontSize]
#define USHARE_APPKEY  @"5a7802d9f29d9849fa000037"

#define Macro_AppDelegate   ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define Macro_TopAppDelegate  ([[UIApplication sharedApplication] keyWindow])
#define ScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define ScreenHeight ([[UIScreen mainScreen] bounds].size.height)

#define PXChange(r) ((ScreenWidth/750.f)*(r))
#define iPhoneXTabHeigth (kIs_iPhoneX ? 34 : 0)

#define IS_3_5_INCH          ([[UIScreen mainScreen] bounds].size.width == 320 && [[UIScreen mainScreen] bounds].size.height == 480 ? YES:NO)
#define IS_4_0_INCH          ([[UIScreen mainScreen] bounds].size.width == 320 && [[UIScreen mainScreen] bounds].size.height == 568 ? YES:NO)
#define IS_4_7_INCH          ([[UIScreen mainScreen] bounds].size.width == 375 && [[UIScreen mainScreen] bounds].size.height == 667 ? YES:NO)
#define IS_5_5_INCH          ([[UIScreen mainScreen] bounds].size.width == 414 && [[UIScreen mainScreen] bounds].size.height == 736 ? YES:NO)
//是否iPhoneX YES:iPhoneX屏幕 NO:传统屏幕

#define kIs_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define LAppID @"rPFExPW31aXdfHuv0Ia0pf02-gzGzoHsz"
#define LAppKey @"P9pqYFfjaL9GNXBPHu2i7bE9"
#define LMasterKey @"UauwbDtcT3TYSbfr75zpXSdV"

#define UMAppKey @"5aab9bada40fa30fb50001b2"

#define BMOBApid @"64716e5c7d5e5c3e8cff996edbe8b3c4"
#define RestAoid @"85acdfc2ef815a4f60c0ec79113fb217"
#define SECRETKey @"57b6fcc9d5133bbf"
#define masterKey @"08486948d76c59e8d50106a867310661"


#define BH_Color_Main @"#1296db"
#endif /* defineHeader_h */
