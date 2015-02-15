//
//  ViewController.m
//  ARHautauTodo
//
//  Created by Andrew Hautau on 2/11/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import "ViewController.h"

#import "TodoListDelegate.h"
#import "Constants.h"


@interface ViewController ()


@property (strong, nonatomic) TodoListDelegate *todoListDelegate;

@property (weak) IBOutlet NSTableView *tableView;
@property (weak) IBOutlet NSTextField *todoTitleField;
@property (weak) IBOutlet NSTextField *todoTextField;

@property (weak) IBOutlet NSButton *addButton;
@property (weak) IBOutlet NSButton *removeButton;

@end


@implementation ViewController {
    NSInteger _currentSelection;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.todoListDelegate = [[TodoListDelegate alloc] initWithTableView: self.tableView];
    
    [self.todoTitleField setDelegate:self];
    [self.todoTextField setDelegate: self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateInterfaceWithNotification:)
                                                 name: ClickedTableViewRow object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(clearTextFields) name:ClearTextFields object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(disableRemoveButton)
                                                 name:DisableRemoveButton
                                               object:nil];
    [self.removeButton setEnabled:NO];
    
    [self.tableView setAllowsMultipleSelection:YES];
}

-(void) viewWillAppear {
    
    id document = [[[[self view] window] windowController] document];
    TodoList *todoList = [document todoList];
    
    
    if ([todoList isKindOfClass: [TodoList class]]) {
        [self setTodoList: todoList];
    } else {
        TodoList *todoList = [[TodoList alloc] init];
        [self setTodoList: todoList];
        [document setTodoList:todoList];
    }
    
    [self updateInterface];
}

-(void) controlTextDidChange:(NSNotification *)obj {
    NSString *todoTitle = [self.todoTitleField stringValue];
    NSString *todoText = [self.todoTextField stringValue];
    [self.todoList updateTodoItemAtIndex: _currentSelection WithTitle:todoTitle AndText:todoText];
    [self updateInterface];
}

-(void) clearTextFields {
    [self.todoTitleField setStringValue:@""];
    [self.todoTextField setStringValue:@""];
}

-(void) disableRemoveButton {
    [self.removeButton setEnabled: NO];
}


-(void) updateInterfaceWithNotification:(NSNotification*) notification {
    NSInteger rowSelection = [notification.userInfo[@"clickedRow"] integerValue];
    _currentSelection = rowSelection;
    
    NSString *title = [self.todoList titleForTodoItemAtIndex: rowSelection];
    NSString * text = [self.todoList textForTodoItemAtIndex: rowSelection];
    
    [self.removeButton setEnabled:
     YES];
    
    if (title) {
        [self.todoTitleField setStringValue: title];
    }
    if (text) {
        [self.todoTextField setStringValue:text];
    }
}


-(void) updateInterface {
    [self.todoListDelegate updateTableViewWithTitles: [self.todoList itemTitles]];
}

- (IBAction)addButtonClicked:(id)sender {
    [self.todoList addItemWithTitle:@"New Item" andText: @"Add a description..."];
    [self updateInterface];
}

- (IBAction)removeButtonClicked:(id)sender {
    NSIndexSet *selectedRows = [self.tableView selectedRowIndexes];
    [self.todoList removeItemsWithIndexSet: selectedRows];
    [self updateInterface];
    [self clearTextFields];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
