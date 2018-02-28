//
//  LYMoudleCenterProtocol.h
//  LYMoudleCenter
//
//  Created by liyan on 2018/2/24.
//  Copyright © 2018年 liyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LYMoudleCenterProtocol <NSObject>

- (void)setup;



@optional




#pragma mark - AppDelegate

/**
 程序已启动，但状态未改变
 */
- (void)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

/**
 应用启动
 
 @param application application description
 @param launchOptions launchOptions description
 */
- (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;


/**
 切换到后台事件
 */
- (void)didEnterBackground:(UIApplication *)application;


/**
 切换回前台事件
 */
- (void)didBecomeActive:(UIApplication *)application;


/**
 即将退出事件
 */
- (void)willTerminate:(UIApplication *)application;

- (void)willResignActive:(UIApplication *)application;

- (void)willEnterForeground:(UIApplication *)application;

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler;

- (void)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error;

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userinfo;

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler;

- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler;

- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void (^)(NSDictionary *))reply;

- (void)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray *))restorationHandler;
@end
