//
//  TodoItemDescriptionFieldDelegate.h
//  ARHautauTodo
//
//  Created by Andrew Hautau on 2/12/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TodoItem.h"

@interface TodoItemDescriptionFieldDelegate : NSObject <NSTextFieldDelegate>

-(instancetype) initWithTextField: (NSTextField*) textField;
-(void)updateTextFieldWithDescription:(NSString *)description;

@end
