//
//  ViewController.m
//  ZMBadge
//
//  Created by gzm on 17/1/3.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "ViewController.h"
#import "UIView+ZMBadge.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.badge = @"100";
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
