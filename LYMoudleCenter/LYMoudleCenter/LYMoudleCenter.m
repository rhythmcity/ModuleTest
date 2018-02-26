//
//  LYMoudleCenter.m
//  LYMoudleCenter
//
//  Created by liyan on 2018/2/24.
//  Copyright © 2018年 liyan. All rights reserved.
//

#import "LYMoudleCenter.h"
@interface LYMoudleCenter ()
@property (nonatomic, strong) NSMutableSet<id<LYMoudleCenterProtocol>> *modules;
@end
@implementation LYMoudleCenter

+ (instancetype)defaultMoudleCenter {
    static LYMoudleCenter *_moudleCenter;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _moudleCenter = [[LYMoudleCenter alloc] init];
    });
    return _moudleCenter;
}

- (dispatch_queue_t)moduleCenterQueue {
    static dispatch_queue_t moduleQueue = NULL;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        moduleQueue = dispatch_queue_create("com.Mr_Tomato.moduleQueue", NULL);
    });
    
    return moduleQueue;
}

- (NSMutableSet *)modules {
    if (!_modules) {
        _modules = [NSMutableSet set];
    }
    return _modules;
}

- (void)resigterMoudle:(id<LYMoudleCenterProtocol>)module {
    dispatch_async([self moduleCenterQueue], ^{
        if (![self.modules containsObject:module] && module) {
            [self.modules addObject:module];
        }
    });
}

- (void)unresigterMoudle:(id<LYMoudleCenterProtocol>)module {
    dispatch_async([self moduleCenterQueue], ^{
        if ([self.modules containsObject:module]) {
            [self.modules removeObject:module];
        }
    });
}

- (void)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    dispatch_async([self moduleCenterQueue], ^{
        [self.modules enumerateObjectsUsingBlock:^(id<LYMoudleCenterProtocol>  _Nonnull obj, BOOL * _Nonnull stop) {
            if ([obj respondsToSelector:@selector(application:willFinishLaunchingWithOptions:)]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [obj application:application willFinishLaunchingWithOptions:launchOptions];
                });
            }
        }];
    });
}

- (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    dispatch_async([self moduleCenterQueue], ^{
        [self.modules enumerateObjectsUsingBlock:^(id<LYMoudleCenterProtocol>  _Nonnull obj, BOOL * _Nonnull stop) {
            if ([obj respondsToSelector:@selector(application:didFinishLaunchingWithOptions:)]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [obj application:application didFinishLaunchingWithOptions:launchOptions];
                });
            }
        }];
    });
}

- (void)didEnterBackground:(UIApplication *)application {
    dispatch_async([self moduleCenterQueue], ^{
        [self.modules enumerateObjectsUsingBlock:^(id<LYMoudleCenterProtocol>  _Nonnull obj, BOOL * _Nonnull stop) {
            if ([obj respondsToSelector:@selector(didEnterBackground:)]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [obj didEnterBackground:application];
                });
            }
        }];
    });
}

- (void)didBecomeActive:(UIApplication *)application {
    
    dispatch_async([self moduleCenterQueue], ^{
        [self.modules enumerateObjectsUsingBlock:^(id<LYMoudleCenterProtocol>  _Nonnull obj, BOOL * _Nonnull stop) {
            if ([obj respondsToSelector:@selector(didBecomeActive:)]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [obj didBecomeActive:application];
                });
            }
        }];
    });
}

- (void)willTerminate:(UIApplication *)application {
    
    dispatch_async([self moduleCenterQueue], ^{
        [self.modules enumerateObjectsUsingBlock:^(id<LYMoudleCenterProtocol>  _Nonnull obj, BOOL * _Nonnull stop) {
            if ([obj respondsToSelector:@selector(willTerminate:)]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [obj willTerminate:application];
                });
            }
        }];
    });
}

- (void)willResignActive:(UIApplication *)application {
    
    dispatch_async([self moduleCenterQueue], ^{
        [self.modules enumerateObjectsUsingBlock:^(id<LYMoudleCenterProtocol>  _Nonnull obj, BOOL * _Nonnull stop) {
            if ([obj respondsToSelector:@selector(willResignActive:)]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [obj willResignActive:application];
                });
            }
        }];
    });
    
}

- (void)willEnterForeground:(UIApplication *)application {
    dispatch_async([self moduleCenterQueue], ^{
        [self.modules enumerateObjectsUsingBlock:^(id<LYMoudleCenterProtocol>  _Nonnull obj, BOOL * _Nonnull stop) {
            if ([obj respondsToSelector:@selector(willEnterForeground:)]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [obj willEnterForeground:application];
                });
            }
        }];
    });
}

-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    
    dispatch_async([self moduleCenterQueue], ^{
        [self.modules enumerateObjectsUsingBlock:^(id<LYMoudleCenterProtocol>  _Nonnull obj, BOOL * _Nonnull stop) {
            if ([obj respondsToSelector:@selector(application:performActionForShortcutItem:completionHandler:)]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [obj application:application performActionForShortcutItem:shortcutItem completionHandler:completionHandler];
                });
            }
        }];
    });
    
}

- (void)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    dispatch_async([self moduleCenterQueue], ^{
        [self.modules enumerateObjectsUsingBlock:^(id<LYMoudleCenterProtocol>  _Nonnull obj, BOOL * _Nonnull stop) {
            if ([obj respondsToSelector:@selector(application:openURL:sourceApplication:annotation:)]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [obj application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
                });
            }
        }];
    });
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    dispatch_async([self moduleCenterQueue], ^{
        [self.modules enumerateObjectsUsingBlock:^(id<LYMoudleCenterProtocol>  _Nonnull obj, BOOL * _Nonnull stop) {
            if ([obj respondsToSelector:@selector(application:didRegisterForRemoteNotificationsWithDeviceToken:)]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [obj application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
                });
            }
        }];
    });
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    dispatch_async([self moduleCenterQueue], ^{
        [self.modules enumerateObjectsUsingBlock:^(id<LYMoudleCenterProtocol>  _Nonnull obj, BOOL * _Nonnull stop) {
            if ([obj respondsToSelector:@selector(application:didFailToRegisterForRemoteNotificationsWithError:)]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [obj application:application didFailToRegisterForRemoteNotificationsWithError:error];
                });
            }
        }];
    });
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userinfo {
    dispatch_async([self moduleCenterQueue], ^{
        [self.modules enumerateObjectsUsingBlock:^(id<LYMoudleCenterProtocol>  _Nonnull obj, BOOL * _Nonnull stop) {
            if ([obj respondsToSelector:@selector(application:didReceiveRemoteNotification:)]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [obj application:application didReceiveRemoteNotification:userinfo];
                });
            }
        }];
    });
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    dispatch_async([self moduleCenterQueue], ^{
        [self.modules enumerateObjectsUsingBlock:^(id<LYMoudleCenterProtocol>  _Nonnull obj, BOOL * _Nonnull stop) {
            if ([obj respondsToSelector:@selector(application:didReceiveRemoteNotification:fetchCompletionHandler:)]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [obj application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
                });
            }
        }];
    });
}

- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    dispatch_async([self moduleCenterQueue], ^{
        [self.modules enumerateObjectsUsingBlock:^(id<LYMoudleCenterProtocol>  _Nonnull obj, BOOL * _Nonnull stop) {
            if ([obj respondsToSelector:@selector(application:performFetchWithCompletionHandler:)]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [obj application:application performFetchWithCompletionHandler:completionHandler];
                });
            }
        }];
    });
}

- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void (^)(NSDictionary *))reply {
    dispatch_async([self moduleCenterQueue], ^{
        [self.modules enumerateObjectsUsingBlock:^(id<LYMoudleCenterProtocol>  _Nonnull obj, BOOL * _Nonnull stop) {
            if ([obj respondsToSelector:@selector(application:handleWatchKitExtensionRequest:reply:)]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [obj application:application handleWatchKitExtensionRequest:userInfo reply:reply];
                });
            }
        }];
    });
}

- (void)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray *))restorationHandler {
    dispatch_async([self moduleCenterQueue], ^{
        [self.modules enumerateObjectsUsingBlock:^(id<LYMoudleCenterProtocol>  _Nonnull obj, BOOL * _Nonnull stop) {
            if ([obj respondsToSelector:@selector(application:continueUserActivity:restorationHandler:)]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [obj application:application continueUserActivity:userActivity restorationHandler:restorationHandler];
                });
            }
        }];
    });
}

@end
