//
//  ViewController.m
//  IOS_Assignment1_C
//
//  Created by Rui Geng on 2016-09-27.
//  Copyright © 2016 Rui GengGengRui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)onTick:(NSTimer *)timer {
    _currentIncome += 0.01;
    _currentIncomeLabel.text = [NSString stringWithFormat:@"$ %.04f", _currentIncome];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _currentIncome = 0.00;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startTimer:(id)sender {
    
    if(_timer == nil){
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target: self
                                                selector:@selector(onTick:)
                                                userInfo:nil repeats:YES];
    }
}

- (IBAction)stopTimer:(id)sender {
    if(_timer){
        [_timer invalidate];
        _timer = nil;
    }
}

@end
