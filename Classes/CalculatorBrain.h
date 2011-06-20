//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Mike Skwarcan on 6/10/11.
//  Copyright 2011 Balcom Agency. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CalculatorBrain : NSObject {
@private
	NSMutableDictionary *calculator;
	double operand;
	NSString *waitingOperation;
	double waitingOperand;
	double storeOperand;
}

- (double)performOperation:(NSString *)operation;
- (void)setVariableAsOperand:(NSString *)variableName;

@property double operand;
@property double waitingOperand;
@property double storeOperand;

@property (readonly) id expression;
@property (retain) NSString *waitingOperation;

+ (double)evaluateExpression:(id)anExpression
		 usingVariableValues:(NSDictionary *)variables;

+ (NSSet *)variablesInExpression:(id)anExpression;
+ (NSString *)descriptionOfExpression:(id)anExpression;

+ (id)propertyListForExpression:(id)anExpression;
+ (id)expressionForPropertyList:(id)propertyList;

@end
