//
//  TodoList.h
//  ToDo
//
//  Created by Andrew Hautau on 2/5/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TodoItem.h"

@interface TodoList : NSObject <NSCoding>

@property (readwrite, nonatomic) BOOL canAddDuplicateItems;

-(void) addItemWithTitle:(NSString *)title andText: (NSString*) text;
-(void) removeItemsWithIndexSet:(NSIndexSet*) indexSet;
-(NSString*) titleForTodoItemAtIndex: (NSInteger) index;
-(NSString*) textForTodoItemAtIndex: (NSInteger) index;

-(void) updateTodoItemAtIndex:(NSInteger) index WithTitle:(NSString *) title AndText:(NSString*) text;

-(NSArray*)itemTitles;  // an array of all item titles (NSString*)
-(NSArray*)allItems;    // an array of all items
-(NSUInteger)itemCount; // number of items contained in list

+(instancetype)morningList;
+(instancetype)eveningList;

@end
