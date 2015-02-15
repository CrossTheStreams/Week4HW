//
//  TodoItemDataSource.m
//  ARHautauTodo
//
//  Created by Andrew Hautau on 2/12/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import "TodoItemTitleFieldDelegate.h"

@interface TodoItemTitleFieldDelegate()

@property (strong, nonatomic) NSTextField *textField;

@end

@implementation TodoItemTitleFieldDelegate : NSObject

-(instancetype) initWithTextField: (NSTextField*) textField {
    self = [super init];
    if (self) {
        [self setTextField: textField];
        [self.textField setDelegate:self];
    }
    return self;
}

-(void)updateTextFieldWithTitle:(NSString *)title {

}

//- (NSView *)tableView:(NSTableView *)tableView
//   viewForTableColumn:(NSTableColumn *)tableColumn
//                  row:(NSInteger)row {
//    NSTableCellView *result = [tableView makeViewWithIdentifier:@"TodoTitleCell" owner:nil];
//    result.textField.stringValue = [[self.todoList itemTitles] objectAtIndex:row];
//    return result;
//}
//
//-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
//    return [[self.todoList allItems] count];
//}
//
//- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
//    CGFloat height = 30.0;
//    return height;
//}


@end
