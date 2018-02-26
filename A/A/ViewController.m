//
//  ViewController.m
//  A
//
//  Created by liyan on 2018/2/12.
//  Copyright © 2018年 liyan. All rights reserved.
//

#import "ViewController.h"
#import <LYRouterModule/LYRouterModule.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"A";
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor grayColor];
    
    [button setTitle:@"push c" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(100, 200, 100, 100);
    button1.backgroundColor = [UIColor grayColor];
    
    [button1 setTitle:@"push B1" forState:UIControlStateNormal];
    
    [button1 addTarget:self action:@selector(buttonClick1:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(100, 300, 100, 100);
    button2.backgroundColor = [UIColor grayColor];
    
    [button2 setTitle:@"push B2" forState:UIControlStateNormal];
    
    [button2 addTarget:self action:@selector(buttonClick2:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button2];
    
}


- (void)buttonClick:(UIButton *)sender {
    
    [[LYRouter defaultRouter] open:@"c"];
    
    
}

- (void)buttonClick1:(UIButton *)sender {
    
    [[LYRouter defaultRouter] open:@"b1" target:nil responseHandler:^(NSError *error, NSDictionary *responseObject) {
        NSLog(@"%@",responseObject);
    }];
    
    
}

- (void)buttonClick2:(UIButton *)sender {
    [[LYRouter defaultRouter] open:@"b2" target:nil parmaDic:@{@"color":[UIColor greenColor]} responseHandler:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
