//
//  LYServiceManager.h
//  LYServiceManager
//
//  Created by liyan on 2018/2/27.
//  Copyright © 2018年 liyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYServiceManager : NSObject

+ (instancetype)shareServiceManager;


- (void)resigterProtocol:(Protocol *)protocol impleClass:(Class )implClass;

- (Class)service:(Protocol *)protcol;

@end


