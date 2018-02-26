//
//  LYRouterRequset.m
//  LYRouterModule
//
//  Created by liyan on 2018/2/23.
//  Copyright © 2018年 liyan. All rights reserved.
//

#import "LYRouterRequest.h"

@implementation LYRouterRequest


- (void)setUrlString:(NSString *)urlString {
    _urlString = urlString;
    
    _pName = urlString;
}

+ (instancetype)requestWithURLString:(NSString *)URLString
                            paramDic:(NSDictionary *)paramDic
                      resultCallback:(LYRouterResultCallback)resultCallback {
    LYRouterRequest *request = [[LYRouterRequest alloc] init];
    request.urlString = URLString;
    request.resultCallBack = resultCallback;
    request.paramDic = paramDic;
    return request;
}
@end
