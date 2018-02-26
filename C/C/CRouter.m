//
//  CRouter.m
//  C
//
//  Created by liyan on 2018/2/24.
//  Copyright © 2018年 liyan. All rights reserved.
//

#import "CRouter.h"
#import "CViewController.h"
@implementation CRouter
+ (BOOL)openRequest:(LYRouterRequest *)request application:(UIApplication *)application annotation:(id)annotation target:(UIViewController *)target {
    
    if (!request.pName) {
        return NO;
    }
    if ([request.pName isEqualToString:@"c"]) {
        CViewController *VC = [[CViewController alloc] init];
        [target.navigationController pushViewController:VC animated:YES];
        return YES;
    }
    
    return NO;
}

@end
