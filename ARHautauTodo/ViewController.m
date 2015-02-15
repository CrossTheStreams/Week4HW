//
//  ViewController.m
//  ARHautauTodo
//
//  Created by Andrew Hautau on 2/11/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import "ViewController.h"
#import "TodoList.h"
#import "TodoListDelegate.h"
#import "Constants.h"


@interface ViewController ()

@property (strong, nonatomic) TodoList *todoList;
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
    
    TodoList *todoList = [TodoList morningList];
    
    self.todoList = todoList;
    self.todoListDelegate = [[TodoListDelegate alloc] initWithTableView: self.tableView];
    
    [self.todoTitleField setDelegate:self];
    [self.todoTextField setDelegate: self];
    
    [self updateInterface];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateInterfaceWithNotification:) name: ClickedTableViewRow object:nil];
}

-(void) controlTextDidChange:(NSNotification *)obj {
    NSString *todoTitle = [self.todoTitleField stringValue];
    NSString *todoText = [self.todoTextField stringValue];
    [self.todoList updateTodoItemAtIndex: _currentSelection WithTitle:todoTitle AndText:todoText];
    [self updateInterface];
}


-(void) updateInterfaceWithNotification:(NSNotification*) notification {
    
    NSInteger rowSelection = [notification.userInfo[@"clickedRow"] integerValue];
    _currentSelection = rowSelection;
    
    NSString *title = [self.todoList titleForTodoItemAtIndex: rowSelection];
    NSString * text = [self.todoList textForTodoItemAtIndex: rowSelection];
    
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



- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
