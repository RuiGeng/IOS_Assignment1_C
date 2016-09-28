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
@property double currentIncome;
@property NSTimer *timer;


@end

