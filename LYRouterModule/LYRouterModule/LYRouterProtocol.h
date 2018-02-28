//
//  LYRouterProtocol.h
//  LYRouterModule
//
//  Created by liyan on 2018/2/23.
//  Copyright © 2018年 liyan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
#import "LYRouterRequest.h"
@protocol LYRouterProtocol <NSObject>
/**
 统一跳转的方法

 @param request
 @param application
 @param annotation
 @param target
 @return
 */
+ (BOOL)openRequest:(LYRouterRequest *)request application:(UIApplication *)application annotation:(id)annotation target:(UIViewController *)target;
@end
