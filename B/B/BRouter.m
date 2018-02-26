//
//  BRouter.m
//  B
//
//  Created by liyan on 2018/2/24.
//  Copyright © 2018年 liyan. All rights reserved.
//

#import "BRouter.h"
#import "BViewController.h"
#import "B_OneViewController.h"
#import "B_TwoViewController.h"

@implementation BRouter


+ (BOOL)openRequest:(LYRouterRequest *)request application:(UIApplication *)application annotation:(id)annotation target:(UIViewController *)target {
    
    if (!request.pName) {
        return NO;
    }
    if ([request.pName isEqualToString:@"b"]) {
        BViewController *bVC = [[BViewController alloc] init];
        [target.navigationController pushViewController:bVC animated:YES];
        return YES;
    }
    
    
    if ([request.pName isEqualToString:@"b1"]) {
        B_OneViewController *bVC = [[B_OneViewController alloc] init];
        bVC.callBack = request.resultCallBack;
        [target.navigationController pushViewController:bVC animated:YES];
        return YES;
    }
    
    if ([request.pName isEqualToString:@"b2"]) {
        B_TwoViewController *bVC = [[B_TwoViewController alloc] init];
        bVC.backColor = [request.paramDic objectForKey:@"color"];
        [target.navigationController pushViewController:bVC animated:YES];
        return YES;
    }
    return NO;
}
@end
