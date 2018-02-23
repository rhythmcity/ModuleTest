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


- (void)resigterWithPageName:(NSString *)pName handler:(Class<LYRouterProtocol>)handler;


- (BOOL)open:(NSString *)url target:(nullable __kindof UIViewController *)target responseHandler:(nullable LYRouterResultCallback)responseHandler;



@end

NS_ASSUME_NONNULL_END
