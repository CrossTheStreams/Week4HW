//
//  TodoListItem.m
//  ToDo
//
//  Created by Andrew Hautau on 2/5/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import "TodoItem.h"

@implementation TodoItem


-(instancetype)initWithTitle:(NSString*)title AndText:(NSString*) text {
    self = [super init];
    if (self) {
        [self setTitle:title];
        [self setText: text];
    }
    return self;
}

@end
