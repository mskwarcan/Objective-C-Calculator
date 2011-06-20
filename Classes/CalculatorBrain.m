//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Mike Skwarcan on 6/10/11.
//  Copyright 2011 Balcom Agency. All rights reserved.
//

#import "CalculatorBrain.h"
#define VARIABLE_PREFIX @"%"


@implementation CalculatorBrain
@synthesize operand;
@synthesize waitingOperand;
@synthesize storeOperand;

@synthesize expression;
@synthesize waitingOperation;

- (void)setOperand:(double)aDouble
{
	operand = aDouble;
}

- (id)expression
{
	
	return [self];
}

- (void)performWaitingOperation
{
	if ([@"+" isEqual:waitingOperation]) {
		operand = waitingOperand + operand;
	}
	else if ([@"*" isEqual:waitingOperation]) {
		operand = waitingOperand * operand;
	}
	else if ([@"-" isEqual:waitingOperation]) {
		operand = waitingOperand - operand;
	}
	else if ([@"/" isEqual:waitingOperation]) {
		if (operand)
		{
			operand = waitingOperand / operand;
		}
	}
}

- (double)performOperation:(NSString *)operation
{
	if([operation isEqual:@"sqrt"])
		{
			operand = sqrt(operand);
		}
	else if ([@"+/-" isEqual:operation])
	{
		operand = - operand;
	}
	else if ([@"Store" isEqual:operation])
	{
		storeOperand = operand;
	}
	else if ([@"Recall" isEqual:operation])
	{
		operand = storeOperand;
	}
	else if ([@"Mem+" isEqual:operation])
	{
		storeOperand = storeOperand + operand;
	}
	else if ([@"C" isEqual:operation])
	{
		storeOperand = 0;
		operand = 0;
	}
	else {
		[self performWaitingOperation];
		waitingOperation = operation;
		waitingOperand = operand;
	}

	return operand;
}

- (void)setVariableAsOperand:(NSString *)variableName
{
}

+ (double)evaluateExpression:(id)anExpression
		 usingVariableValues:(NSDictionary *)variables
{
}

+ (NSSet *)variablesInExpression:(id)anExpression
{
	
}

+ (NSString *)descriptionOfExpression:(id)anExpression
{
}

+ (id)propertyListForExpression:(id)anExpression
{
}

+ (id)expressionForPropertyList:(id)propertyList
{
}

- (void) dealloc
{
	[super dealloc];
}

@end
