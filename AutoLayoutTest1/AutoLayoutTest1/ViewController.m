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
    
    UIViewController *toolViewControler = [[UIViewController alloc] initWithNibName:@"RightToolView" bundle:nil];
    NSLog(@"tool view frame is %@", NSStringFromCGRect( toolViewControler.view.frame));
    CGSize toolViewSize = toolViewControler.view.frame.size;
    toolViewControler.view.frame = CGRectMake(CGRectGetWidth(self.view.frame) - toolViewSize.width,
                                              (CGRectGetHeight(self.view.frame) - toolViewSize.height) / 2,
                                              toolViewSize.width, toolViewSize.height);
    
    [self.view addSubview:toolViewControler.view];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
