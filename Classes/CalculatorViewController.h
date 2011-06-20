//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Mike Skwarcan on 6/10/11.
//  Copyright 2011 Balcom Agency. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"
#define VARIABLE_PREFIX @"%"

@interface CalculatorViewController : UIViewController {
@private
	IBOutlet UILabel *display;
	CalculatorBrain *brain;
	BOOL userIsInTheMiddleOfTypingANumber;
}

@property (retain) IBOutlet UILabel *display;

- (IBAction)digitPressed:(UIButton *)sender;
- (IBAction)operationPressed:(UIButton *)sender;
- (IBAction)setVariableAsOperand:(UIButton *)sender;

@end

