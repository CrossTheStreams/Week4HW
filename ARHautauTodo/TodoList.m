//
//  TodoList.m
//  ToDo
//
//  Created by Andrew Hautau on 2/5/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import "TodoList.h"

@interface TodoList()

@property (strong, nonatomic) NSMutableArray *itemArray;
@property (strong, nonatomic) NSArray *todoItemIds;

@end

@implementation TodoList


-(id) init {
    self = [super init];
    if (self) {
      [self setItemArray: [[NSMutableArray alloc] init]];
        self.canAddDuplicateItems = YES;
    }
    return self;
}

-(id) initWithTitles:(NSArray*) titles {
    self = [self init];
    if (self) {
        for (NSString *title in titles) {
            [self addItemWithTitle:title andText: @"Remember to do this..."];
        }
    }
    return self;
}

-(void) addItem:(TodoItem *)item {
    if ([self canAddItem:item]) {
        [[self itemArray] addObject:item];
    }
}

-(BOOL) canAddItem:(TodoItem *)item {
    if (self.canAddDuplicateItems) {
        return YES;
    } else {
        if ([self hasItemWithTitle:item.title]) {
            return NO;
        } else {
            return YES;
        }
    }
}

-(void) addItemWithTitle:(NSString *)title andText: (NSString*) text {
    TodoItem *item = [[TodoItem alloc] initWithTitle:title AndText:text];
    [self addItem:item];
}

-(BOOL)hasItemWithTitle:(NSString*)title {
    BOOL hasItem = NO;
    for (TodoItem *item in self.itemArray) {
        NSString *itemTitle = item.title;
        if ([itemTitle isEqualToString:title]) {
            hasItem = YES;
        }
    }
    return hasItem;
}

-(void)removeItemWithTitle:(NSString*) title {
    NSUInteger index = [self.itemArray indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        TodoItem *item = [self.itemArray objectAtIndex:idx];
        return [item.title isEqualToString:title];
    }];
    [self.itemArray removeObjectAtIndex:index];
}

-(void) removeItemAtIndex:(NSInteger)index {
    [self.itemArray removeObjectAtIndex: index];
}

-(void) removeItemsWithIndexSet:(NSIndexSet*) indexSet {
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < [self.itemArray count]; i++) {
        if ([indexSet containsIndex: i]) {
            continue;
        } else {
            [newArray addObject: [self.itemArray objectAtIndex:i]];
        }
    }
    self.itemArray = newArray;
}

-(NSArray*) allItems {
    return [NSArray arrayWithArray:self.itemArray];
}

-(NSArray*) itemTitles {
    NSMutableArray *titles = [NSMutableArray new];
    for (TodoItem *item in self.itemArray) {
        [titles addObject:item.title];
    }
    return [NSArray arrayWithArray: titles];
}

-(NSUInteger) itemCount {
    return [self.itemArray count];
}

-(NSString*) titleForTodoItemAtIndex:(NSInteger)index {
    return [[self.itemArray objectAtIndex:index] title];
}

-(NSString*) textForTodoItemAtIndex:(NSInteger) index {
    return [[self.itemArray objectAtIndex:index] text];
}

#pragma mark NSCoding 

-(void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject: self.itemArray forKey: @"itemArray"];
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        self.itemArray = [decoder decodeObjectForKey:@"itemArray"];
    }
    return self;
}

#pragma mark Seed Data Lists

+(TodoList*) morningList {
    NSArray *titles = @[@"brush teeth", @"shower", @"breakfast"];
    TodoList *list = [[TodoList alloc] initWithTitles:titles];
    return list;
}

+(TodoList*) eveningList {
    NSArray *titles = @[@"dinner", @"shower", @"sleep"];
    TodoList *list = [[TodoList alloc] initWithTitles:titles];
    return list;
}

-(void) updateTodoItemAtIndex:(NSInteger) index WithTitle:(NSString *) title AndText:(NSString*) text {
    TodoItem *item = [self.itemArray objectAtIndex:index];
    item.title = title;
    item.text = text;
}

@end
