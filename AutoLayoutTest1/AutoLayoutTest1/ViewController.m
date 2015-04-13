//
//  ViewController.m
//  AutoLayoutTest1
//
//  Created by Frank Zheng on 15/4/12.
//  Copyright (c) 2015年 Frank Zheng. All rights reserved.
//

#import "ViewController.h"



#define kTitleBarHeight 30.0f
#define kBottomBarHeight 40.0f



@interface ViewController ()

@property(nonatomic, strong) NSMutableArray *subViewContollers;
@property(nonatomic, strong) SlideSwitchView *slideSwitchView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"view frame is %@", NSStringFromCGRect(self.view.frame));
    self.title = @"Restaurant Layout";
    
    //remove the offset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //add tool view
    UIViewController *toolViewControler = [[UIViewController alloc] initWithNibName:@"RightToolView" bundle:nil];
    NSLog(@"tool view frame is %@", NSStringFromCGRect( toolViewControler.view.frame));
    CGSize toolViewSize = toolViewControler.view.frame.size;
    toolViewControler.view.frame = CGRectMake(CGRectGetWidth(self.view.frame) - toolViewSize.width,
                                              (CGRectGetHeight(self.view.frame) - toolViewSize.height) / 2,
                                              toolViewSize.width, toolViewSize.height);
    
    [self.view addSubview:toolViewControler.view];
    
    //add slide switch view
    [self initSubViewControllers];
    
    CGRect frame = CGRectMake(0, 60,
                              CGRectGetWidth(self.view.frame) - toolViewSize.width,
                              CGRectGetHeight(self.view.frame) - kBottomBarHeight - 60);
    _slideSwitchView = [[SlideSwitchView alloc] initWithFrame:frame];
    _slideSwitchView.tabItemNormalColor = [SlideSwitchView colorFromHexRGB:@"868686"];
    _slideSwitchView.tabItemSelectedColor = [SlideSwitchView colorFromHexRGB:@"bb0b15"];
    _slideSwitchView.shadowImage = [[UIImage imageNamed:@"red_line_and_shadow.png"]
                                        stretchableImageWithLeftCapWidth:59.0f topCapHeight:0.0f];
    _slideSwitchView.slideSwitchViewDelegate = self;
    
    [self.view addSubview:_slideSwitchView];
    
    UIButton *rightSideButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightSideButton setImage:[UIImage imageNamed:@"icon_rightarrow.png"] forState:UIControlStateNormal];
    [rightSideButton setImage:[UIImage imageNamed:@"icon_rightarrow.png"]  forState:UIControlStateHighlighted];
    rightSideButton.frame = CGRectMake(0, 0, 20.0f, 44.0f);
    rightSideButton.userInteractionEnabled = NO;
    _slideSwitchView.rigthSideButton = rightSideButton;
    
    [_slideSwitchView buildUI];

    
    
}

- (void)initSubViewControllers {
    
    NSDictionary *dict = @{ @"Red" : [UIColor redColor],
                            @"Green" : [UIColor greenColor],
                            @"Blue" : [UIColor blueColor],
                            @"Yellow" : [UIColor yellowColor]
                            };
    _subViewContollers = [[NSMutableArray alloc] initWithCapacity:dict.count];
    
    for(NSString *color in dict.allKeys) {
        UIColor *colorValue = dict[color];
        UIViewController *vc = [[UIViewController alloc] init];
        vc.title = color;
        vc.view.backgroundColor = colorValue;
        [_subViewContollers addObject:vc];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger)numberOfTab:(SlideSwitchView *)view {
    return _subViewContollers.count;
}

- (UIViewController *)slideSwitchView:(SlideSwitchView *)view viewOfTab:(NSUInteger)number {
    return [_subViewContollers  objectAtIndex:number];
}

- (void)slideSwitchView:(SlideSwitchView *)view didSelectTab:(NSUInteger)number {
    NSLog(@"didSelectTab, %ld", (long)number);
}

@end
