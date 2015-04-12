//
//  ViewController.m
//  AutoLayoutTest1
//
//  Created by Frank Zheng on 15/4/12.
//  Copyright (c) 2015年 Frank Zheng. All rights reserved.
//

#import "ViewController.h"



#define kTitleBarHeight 30.0f


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"view frame is %@", NSStringFromCGRect(self.view.frame));
    self.title = @"Restaurant Layout";
    
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
