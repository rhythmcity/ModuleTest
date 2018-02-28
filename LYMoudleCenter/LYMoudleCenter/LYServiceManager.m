//
//  LYServiceManager.m
//  LYServiceManager
//
//  Created by liyan on 2018/2/27.
//  Copyright © 2018年 liyan. All rights reserved.
//

#import "LYServiceManager.h"

@interface LYServiceManager ()
@property (nonatomic, strong) NSMutableDictionary *AllServiceDic;
@property (nonatomic, strong) NSMutableDictionary *serviceDic;



@end


@implementation LYServiceManager
+ (instancetype)shareServiceManager {
    static LYServiceManager *_serviceManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceManager = [[LYServiceManager alloc] init];
    });
    return _serviceManager;
}

- (NSMutableDictionary *)AllServiceDic {
    if (!_AllServiceDic) {
        _AllServiceDic = [NSMutableDictionary dictionary];
    }
    return _AllServiceDic;
}

- (NSMutableDictionary *)serviceDic {
    if (!_serviceDic) {
        _serviceDic = [NSMutableDictionary dictionary];
    }
    return _serviceDic;
}

- (void)resigterProtocol:(Protocol *)protocol impleClass:(Class )implClass {
    if (![implClass conformsToProtocol:protocol]) {
        NSLog(@"%@没有遵循%@",NSStringFromClass(implClass),NSStringFromProtocol(protocol));
        return;
    }
    
   
    
    NSString *protoclKey = NSStringFromProtocol(protocol);
    NSString *classValue = NSStringFromClass(implClass);
    
    if ([self.AllServiceDic objectForKey:protoclKey]) {
        NSLog(@"已经注册了%@",protoclKey);
        
        return;
        
    }
    @synchronized(self.AllServiceDic) {
        [self.AllServiceDic setObject:classValue forKey:protoclKey];
    }

}


- (Class)service:(Protocol *)protcol {
    
    
    id implementClass = nil;
    
    NSString *protocolString = NSStringFromProtocol(protcol);
    
    implementClass = [self.serviceDic objectForKey:protocolString];
    
    if (implementClass) {
        return implementClass;
    }
    @synchronized(self.AllServiceDic) {
        implementClass =  NSClassFromString([self.AllServiceDic objectForKey:protocolString]);
        if (implementClass) {
            [self.serviceDic setObject:implementClass forKey:protocolString];
        } else {
             NSLog(@"没有注册%@",protocolString);
        }
    }
    return implementClass;
}


@end
