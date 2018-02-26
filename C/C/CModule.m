//
//  CModule.m
//  C
//
//  Created by liyan on 2018/2/24.
//  Copyright © 2018年 liyan. All rights reserved.
//

#import "CModule.h"
#import "CRouter.h"
@implementation CModule
+ (instancetype)module {
    
    
    return [[CModule alloc] init];
}

- (void)setup {
    
    [[LYMoudleCenter defaultMoudleCenter] resigterMoudle:self];
    [self resigterRouter];
}


- (void)resigterRouter {
    
     [[LYRouter defaultRouter] resigterWithPageName:@"C" handler:[CRouter class]];
}

@end
