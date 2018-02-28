//
//  LYServiceManager.h
//  LYServiceManager
//
//  Created by liyan on 2018/2/27.
//  Copyright © 2018年 liyan. All rights reserved.
//  组件如果需要提供给外部的方法或者返回一些对象可以通过次类 在组件内部注册服务提供给外部调用

#import <UIKit/UIKit.h>

@interface LYServiceManager : NSObject

+ (instancetype)shareServiceManager;


- (void)resigterProtocol:(Protocol *)protocol impleClass:(Class )implClass;

- (Class)service:(Protocol *)protcol;

@end


