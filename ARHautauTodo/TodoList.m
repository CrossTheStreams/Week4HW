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
            [self addItemWithTitle:title];
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

-(BOOL) canAddItemWithTitle:(NSString *)title {
    if ([title isEqualToString:@""]) {
        return NO;
    } else {
        TodoItem *item = [[TodoItem alloc] initWithTitle: title];
        return [self canAddItem:item];
    }

}

-(void) addItemWithTitle:(NSString *)title {
    TodoItem *item = [[TodoItem alloc] initWithTitle:title];
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

#pragma mark NSCoding 

-(void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.itemArray forKey: @"itemsArray"];
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    
    self = [super init];
    if (self) {
        self.itemArray = [decoder decodeObjectForKey:@"itemsArray"];
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

@end
