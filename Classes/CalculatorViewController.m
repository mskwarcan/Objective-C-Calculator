//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Mike Skwarcan on 6/10/11.
//  Copyright 2011 Balcom Agency. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController()
@property (readonly) CalculatorBrain *brain;
@end


@implementation CalculatorViewController

@synthesize display;

- (CalculatorBrain *)brain
{
	if (!brain) brain = [[CalculatorBrain alloc] init];
	return brain;
}

- (IBAction)digitPressed:(UIButton *)sender
{
	// NSString *digit = [[sender titleLabel] text];
	NSString *digit = sender.titleLabel.text;
	
	if (userIsInTheMiddleOfTypingANumber) {
		// [display setText:[[display text] stringByAppendingString:digit]];
		display.text = [display.text stringByAppendingString:digit];
	}
	else {
		//[display setText:digit];
		display.text = digit;
		userIsInTheMiddleOfTypingANumber =YES;
	}

}

- (IBAction)operationPressed:(UIButton *)sender
{
	if (userIsInTheMiddleOfTypingANumber) 
	{
		//[[self brain] setOperand:[[display text] doubleValue]];
		self.brain.operand = [[display text] doubleValue];
		userIsInTheMiddleOfTypingANumber = NO;
	}
	
	NSString *operation = [[sender titleLabel] text];
	//double result = [[self brain] performOperation:operation];
	[self.brain performOperation:operation];
	display.text = [NSString stringWithFormat:@"%g", self.brain.operand];
}

- (IBAction)setVariableAsOperand:(UIButton *)sender
{
	NSString *variable = [[sender titleLabel] text];
	if (userIsInTheMiddleOfTypingANumber) {
		// [display setText:[[display text] stringByAppendingString:digit]];
		[self.brain setVariableAsOperand:[display.text stringByAppendingString:[VARIABLE_PREFIX stringByAppendingString:variable]]];
		display.text = [display.text stringByAppendingString:variable];
	}
	else {
		//[display setText:digit];
		[self.brain setVariableAsOperand:[VARIABLE_PREFIX stringByAppendingString:variable]];
		display.text = variable;
		userIsInTheMiddleOfTypingANumber =YES;
	}
}

- (void) dealloc
{
	[brain release];
	[super dealloc];
}

@end
