//
//  TodoListItem.h
//  ToDo
//
//  Created by Andrew Hautau on 2/5/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoItem : NSObject

@property(strong, nonatomic) NSString *title;
@property(strong, nonatomic) NSString *text;

-(instancetype)initWithTitle:(NSString*)title AndText:(NSString*) text;

@end
