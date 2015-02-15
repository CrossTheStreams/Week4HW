//
//  ViewController.h
//  ARHautauTodo
//
//  Created by Andrew Hautau on 2/11/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TodoList.h"

@interface ViewController : NSViewController <NSTextFieldDelegate>

@property (strong, nonatomic) TodoList *todoList;

@end

