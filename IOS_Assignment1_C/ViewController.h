//
//  ViewController.h
//  IOS_Assignment1_C
//
//  Created by Rui Geng on 2016-09-27.
//  Copyright © 2016 Rui GengGengRui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *currentIncomeLabel;
@property (weak, nonatomic) IBOutlet UISlider *annualSalarySlider;
@property (weak, nonatomic) IBOutlet UILabel *annualSalaryLabel;

@property double currentIncome;
@property double secondIncome;
@property NSTimer *timer;

#define DAY 365
#define HOUR 24
#define MINUTES 60
#define SECOND 60

@end

