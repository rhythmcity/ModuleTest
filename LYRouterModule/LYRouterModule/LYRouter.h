//
//  LYRouter.h
//  LYRouterModule
//
//  Created by liyan on 2018/2/23.
//  Copyright © 2018年 liyan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LYRouterProtocol.h"
#import "LYRouterRequest.h"
NS_ASSUME_NONNULL_BEGIN
@interface LYRouter : NSObject

+ (instancetype)defaultRouter;

/**
 注册跳转事件

 @param pName 页面名称
 @param handler 响应跳转的业务路由
 */
- (void)resigterWithPageName:(NSString *)pName handler:(Class<LYRouterProtocol>)handler;


/**
 跳转事件

 @param url 传入的url
 @return 是否成功打开
 */
- (BOOL)open:(NSString *)url;

/**
 跳转事件

 @param url 传入的url
 @param target 触发跳转的controller
 @param responseHandler callback回调
 @return 是否成功打开
 */
- (BOOL)open:(NSString *)url target:(nullable __kindof UIViewController *)target responseHandler:(nullable LYRouterResultCallback)responseHandler;

/**
 跳转事件

 @param url 传入的url
 @param target 触发跳转的controller
 @param paramDic 跳转时需要的参数
 @param responseHandler callback回调
 @return 是否成功打开
 */
- (BOOL)open:(NSString *)url target:(nullable __kindof UIViewController *)target parmaDic:(nullable NSDictionary *)paramDic responseHandler:(nullable LYRouterResultCallback)responseHandler;
@end

NS_ASSUME_NONNULL_END
