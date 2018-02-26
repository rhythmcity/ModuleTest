//
//  LYRouter.m
//  LYRouterModule
//
//  Created by liyan on 2018/2/23.
//  Copyright © 2018年 liyan. All rights reserved.
//

#import "LYRouter.h"
NSString *const LYRouterDefaultPName = @"^default^";

@interface LYRouter ()

@property (nonatomic, strong) NSMutableSet *pNameSet;
@end

@implementation LYRouter
+ (instancetype)defaultRouter {
    
    static LYRouter *_router = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _router = [[LYRouter alloc] init];
    });
    
    return _router;
}


- (NSMutableSet *)pNameSet {
    if (!_pNameSet) {
        _pNameSet = [NSMutableSet set];
    }
    return _pNameSet;
}

- (void)resigterWithPageName:(NSString *)pName handler:(Class<LYRouterProtocol>)handler {
    if (!pName || !pName.length) {
        pName = LYRouterDefaultPName;
    }
    pName = [pName lowercaseString];
    @synchronized (self.pNameSet) {
        [self.pNameSet addObject:@{pName : NSStringFromClass(handler)}];
    }
}

- (BOOL)open:(NSString *)url {
    return [self open:url target:nil parmaDic:nil responseHandler:nil];
}

- (BOOL)open:(NSString *)url target:(__kindof UIViewController *)target responseHandler:(LYRouterResultCallback)responseHandler {
    
    return [self open:url target:target parmaDic:nil responseHandler:responseHandler];
}

- (BOOL)open:(NSString *)url target:(nullable __kindof UIViewController *)target parmaDic:(nullable NSDictionary *)paramDic responseHandler:(nullable LYRouterResultCallback)responseHandler {
    if (!url) {
        return NO;
    }
    
    LYRouterRequest *request = [LYRouterRequest requestWithURLString:url paramDic:paramDic resultCallback:responseHandler];
    
    @synchronized(self.pNameSet) {
        Class<LYRouterProtocol> handler = [self handleForPName:request.pName];
        if (handler) {
            if (!target) {
                target = [self topViewController];
            }
            if ([handler respondsToSelector:@selector(openRequest:application:annotation:target:)]) {
                return [handler openRequest:request application:nil annotation:nil target:target];
            }
        }
    }
    return NO;
}


- (Class<LYRouterProtocol>)handleForPName:(NSString *)pName {
    
    if (!pName.length) {
        pName = LYRouterDefaultPName;
    }
    @synchronized(self.pNameSet) {
        __block NSString *handler = nil;
        [self.pNameSet enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
            handler = [obj valueForKey:pName];
            if (handler) {
                *stop = YES;
            }
        }];
        
        if (handler) {
            return NSClassFromString(handler);
        }
    }
    return nil;
}

- (UIViewController *)topViewController
{
    UIViewController *target = nil;
    
    target = [self topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    
    if (!target) {
        return  nil;
    }
    
    while (target.presentedViewController) {
        target = [self topViewController:target.presentedViewController];
    }
    
    return target;
}

- (UIViewController *)topViewController:(UIViewController *)vc
{
    if ([vc isKindOfClass:[UINavigationController class]])
    {
        return [self topViewController:[(UINavigationController *)vc topViewController]];
    }
    else if ([vc isKindOfClass:[UITabBarController class]])
    {
        return [self topViewController:[(UITabBarController *)vc selectedViewController]];
    }
    else {
        return vc;
    }
    
    return nil;
}


@end
