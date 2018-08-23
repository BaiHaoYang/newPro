//
//  AppDelegate.h
//  newPro
//
//  Created by HaoYang on 2018/8/23.
//  Copyright © 2018年 HaoYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

