//
//  BMoudle.m
//  B
//
//  Created by liyan on 2018/2/24.
//  Copyright © 2018年 liyan. All rights reserved.
//

#import "BMoudle.h"
#import "BRouter.h"
#import "BService.h"
@implementation BMoudle
+ (instancetype)module {
    
    
    return [[BMoudle alloc] init];
}

- (void)setup {
    
    [[LYMoudleCenter defaultMoudleCenter] resigterMoudle:self];
    [self resigterRouter];
    [self resigterService];
}


- (void)resigterRouter {
    [[LYRouter defaultRouter] resigterWithPageName:@"B" handler:[BRouter class]];
    [[LYRouter defaultRouter] resigterWithPageName:@"B2" handler:[BRouter class]];
    [[LYRouter defaultRouter] resigterWithPageName:@"B1" handler:[BRouter class]];
}


- (void)resigterService {
    
    [[LYServiceManager shareServiceManager] resigterProtocol:@protocol(BProtocol) impleClass:[BService class]];
    
    
}


@end
