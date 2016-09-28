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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    float annualSalaryValue = [userDefaults floatForKey:@"annualsalaryKey"];
    
    if(annualSalaryValue != 0){
        _annualSalarySlider.value = annualSalaryValue;
    }else{
        _annualSalarySlider.value = _annualSalarySlider.minimumValue;
    }
    
    double currentIncomeValue = [userDefaults doubleForKey:@"currentincomeKey"];
    if(currentIncomeValue != 0){
        _currentIncome = currentIncomeValue;
    }else{
        currentIncomeValue = 0.00;
    }
    
    _annualSalaryLabel.text = [NSString stringWithFormat:@"$ %.f", _annualSalarySlider.value];
    
    _currentIncomeLabel.text = [NSString stringWithFormat:@"$ %.04f", _currentIncome];
    
    _secondIncome = _annualSalarySlider.value/DAY/HOUR/MINUTES/SECOND;
    
    
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

- (IBAction)changeSalary:(id)sender {
    _annualSalaryLabel.text = [NSString stringWithFormat:@"$ %.f", _annualSalarySlider.value];
    _secondIncome = _annualSalarySlider.value/DAY/HOUR/MINUTES/SECOND;
}

- (IBAction)saveValues:(id)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setFloat:_annualSalarySlider.value forKey:@"annualsalaryKey"];
    
    [userDefaults setDouble:_currentIncome forKey:@"currentincomeKey"];
    
}

- (void)onTick:(NSTimer *)timer {
    _currentIncome += _secondIncome;
    _currentIncomeLabel.text = [NSString stringWithFormat:@"$ %.04f", _currentIncome];
}


@end
