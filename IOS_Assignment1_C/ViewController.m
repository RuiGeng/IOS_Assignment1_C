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
    
    //Define user default preference
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    //Load annual salary value from preference
    float annualSalaryValue = [userDefaults floatForKey:@"annualsalaryKey"];
    
    if(annualSalaryValue != 0){
        
        //if get the values from the preference then set the values to the slider bar
        _annualSalarySlider.value = annualSalaryValue;
        
    }else{
        
        //if not get the values from preference then set slider bar to minimum value
        _annualSalarySlider.value = _annualSalarySlider.minimumValue;
        
    }
    
    //Load current income value from preference
    double currentIncomeValue = [userDefaults doubleForKey:@"currentincomeKey"];
    
    if(currentIncomeValue != 0){
        
        //if get the values from the preference then set the values to the variable
        _currentIncome = currentIncomeValue;
    }else{
        
        //if not get the values from the preference then set the values as 0
        currentIncomeValue = 0.00;
        
    }
    
    // initial annual salary label
    _annualSalaryLabel.text = [NSString stringWithFormat:@"$ %.f", _annualSalarySlider.value];
    
    // initial current income label
    _currentIncomeLabel.text = [NSString stringWithFormat:@"$ %.04f", _currentIncome];
    
    // cauculate the second income value based on annual salary
    _secondIncome = _annualSalarySlider.value/DAY/HOUR/MINUTES/SECOND;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startTimer:(id)sender {
    
    // if timer not exists
    if(_timer == nil){
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target: self
                                                selector:@selector(onTick:)
                                                userInfo:nil repeats:YES];
    }
}

- (IBAction)stopTimer:(id)sender {
    
    // if has a timer
    if(_timer){
        [_timer invalidate];
        _timer = nil;
    }
}

- (IBAction)changeSalary:(id)sender {
    
    // set annual salary label
    _annualSalaryLabel.text = [NSString stringWithFormat:@"$ %.f", _annualSalarySlider.value];
    
    // cauculate the second income value based on annual salary
    _secondIncome = _annualSalarySlider.value/DAY/HOUR/MINUTES/SECOND;
}

- (IBAction)saveValues:(id)sender {
    
    //Define user default preference
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    //save annual salary
    [userDefaults setFloat:_annualSalarySlider.value forKey:@"annualsalaryKey"];
    
    //save current income
    [userDefaults setDouble:_currentIncome forKey:@"currentincomeKey"];
    
}

- (void)onTick:(NSTimer *)timer {
    
    //calculate current income value
    _currentIncome += _secondIncome;
    
    // set the value to the label
    _currentIncomeLabel.text = [NSString stringWithFormat:@"$ %.04f", _currentIncome];
}

@end
