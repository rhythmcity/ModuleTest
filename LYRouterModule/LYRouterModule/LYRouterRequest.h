//
//  LYRouterRequset.h
//  LYRouterModule
//
//  Created by liyan on 2018/2/23.
//  Copyright © 2018年 liyan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LYRouterResultCallback)(NSError *error, NSDictionary *responseObject);
@interface LYRouterRequest : NSObject

@property (nonatomic, copy)LYRouterResultCallback resultCallBack;

@property (nonatomic, copy)NSString *urlString;

@property (nonatomic, strong)NSDictionary *paramDic;

@property (nonatomic, strong, readonly) NSString *pName;

+ (instancetype)requestWithURLString:(NSString *)URLString
                            paramDic:(NSDictionary *)paramDic
                      resultCallback:(LYRouterResultCallback)resultCallback;
@end
