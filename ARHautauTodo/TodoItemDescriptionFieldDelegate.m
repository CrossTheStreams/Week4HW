//
//  TodoItemDescriptionFieldDelegate.m
//  ARHautauTodo
//
//  Created by Andrew Hautau on 2/12/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import "TodoItemDescriptionFieldDelegate.h"

@interface TodoItemDescriptionFieldDelegate()

@property (strong, nonatomic) NSTextField *textField;

@end

@implementation TodoItemDescriptionFieldDelegate

-(instancetype) initWithTextField: (NSTextField*) textField {
    self = [super init];
    if (self) {
        [self setTextField: textField];
        [self.textField setDelegate:self];
    }
    return self;
}


-(void)updateTextFieldWithDescription:(NSString *)description {

}


@end
