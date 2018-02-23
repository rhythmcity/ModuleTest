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

- (BOOL)open:(NSString *)url target:(nullable __kindof UIViewController *)target responseHandler:(nullable LYRouterResultCallback)responseHandler {
    if (!url) {
        return NO;
    }
    
    LYRouterRequest *request = [LYRouterRequest requestWithURLString:url resultCallback:responseHandler];
    
    @synchronized(self.pNameSet) {
        
        
        
        
    }
    
    
    
    
    
    return NO;
}


- (Class<LYRouterProtocol>)handleForPName:(NSString *)pName {
    
    
    if (!pName.length) {
        pName = LYRouterDefaultPName;
    }
    
    @synchronized(self.pNameSet) {
        
        
    }
    
    return nil;
}

@end
