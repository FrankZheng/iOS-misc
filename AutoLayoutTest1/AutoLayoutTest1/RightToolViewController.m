//
//  RightToolViewController.m
//  AutoLayoutTest1
//
//  Created by zhengxiaoqiang on 15/4/14.
//  Copyright (c) 2015年 Frank Zheng. All rights reserved.
//

#import "RightToolViewController.h"

@interface RightToolViewController ()

@end

@implementation RightToolViewController

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithNibName:@"RightToolView" bundle:nil];
    if(self) {
        //set the frame of view
        self.view.frame = frame;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableNumberStepper.minimumValue = 1;
    _tableNumberStepper.maximumValue = 10;
    [_tableNumberLabel setText:@(1).stringValue];
    
    _tableSeatsStepper.minimumValue = 1;
    _tableSeatsStepper.maximumValue = 10;
    [_tableSeatsLabel setText:@(4).stringValue];
    
    _opposingSwitch.on = NO;
    
    _tableSizeSlider.minimumValue = 1.0f;
    _tableSizeSlider.maximumValue = 4.0f;
    _tableSizeSlider.value = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)tableNumberChanged:(id)sender {
    _tableNumberLabel.text = @(_tableNumberStepper.value).stringValue;
}

- (IBAction)tableSeatsChanged:(id)sender {
    _tableSeatsLabel.text = @(_tableSeatsStepper.value).stringValue;
}

- (IBAction)tableTypeChanged:(id)sender {
    NSLog(@"table type changed, %d", _tableTypeSegment.selectedSegmentIndex);
}

- (IBAction)opposingSwitched:(id)sender {
    NSLog(@"opposing swtiched, %d", _opposingSwitch.on);
}

- (IBAction)tableSizeChanged:(id)sender {
    NSLog(@"table size changed, %f", _tableSizeSlider.value);
}
@end
