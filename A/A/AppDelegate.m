//
//  AppDelegate.m
//  A
//
//  Created by liyan on 2018/2/12.
//  Copyright © 2018年 liyan. All rights reserved.
//

#import "AppDelegate.h"
#import <LYMoudleCenter/LYMoudleCenter.h>
#import <B/B.h>
#import <C/C.h>
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[LYMoudleCenter defaultMoudleCenter] application:application willFinishLaunchingWithOptions:launchOptions];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[BMoudle module] setup];
    
    [[CModule module] setup];
    
    
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    
    self.window.rootViewController = navigation;
    
    return YES;
}


-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    [[LYMoudleCenter defaultMoudleCenter] application:application performActionForShortcutItem:shortcutItem completionHandler:completionHandler];
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    
    
    [[LYMoudleCenter defaultMoudleCenter] application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
    
    [[LYMoudleCenter defaultMoudleCenter] willResignActive:application];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
    
    [[LYMoudleCenter defaultMoudleCenter] didEnterBackground:application];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
    
    [[LYMoudleCenter defaultMoudleCenter] willEnterForeground:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
    
    [[LYMoudleCenter defaultMoudleCenter] didBecomeActive:application];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
    
    [[LYMoudleCenter defaultMoudleCenter] willTerminate:application];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    
    
    [[LYMoudleCenter defaultMoudleCenter] application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    
    
    [[LYMoudleCenter defaultMoudleCenter] application:application didFailToRegisterForRemoteNotificationsWithError:error];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userinfo
{
    
    
    [[LYMoudleCenter defaultMoudleCenter] application:application didReceiveRemoteNotification:userinfo];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler
{
    
    
    [[LYMoudleCenter defaultMoudleCenter] application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
}

- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler
{
    
    
    [[LYMoudleCenter defaultMoudleCenter] application:application performFetchWithCompletionHandler:completionHandler];
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler
{
    
    
    [[LYMoudleCenter defaultMoudleCenter] application:application continueUserActivity:userActivity restorationHandler:restorationHandler];
    
    return YES;
}


@end
