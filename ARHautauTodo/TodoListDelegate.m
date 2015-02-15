//
//  TodoListDataSource.m
//  ARHautauTodo
//
//  Created by Andrew Hautau on 2/12/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import "TodoListDelegate.h"
#import "Constants.h"

@interface TodoListDelegate()

@property (weak, nonatomic) NSTableView *tableView;
@property (strong, nonatomic) NSArray *titleArray;

@end

@implementation TodoListDelegate

-(instancetype) initWithTableView: (NSTableView*) tableView {
    self = [super init];
    if (self) {
        [self setTableView: tableView];
        [self.tableView setDelegate:self];
        [self.tableView setDataSource: self];
    }
    return self;
}

-(void)updateTableViewWithTitles:(NSArray *)titles {
    [self setTitleArray: titles];
    [[self tableView] reloadData];
}

- (NSView *)tableView:(NSTableView *)tableView
   viewForTableColumn:(NSTableColumn *)tableColumn
                  row:(NSInteger)row {
    NSTableCellView *result = [tableView makeViewWithIdentifier:@"TodoItemCell" owner:nil];
    result.textField.stringValue = [self.titleArray objectAtIndex:row];
    
    return result;
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self.titleArray count];
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    CGFloat height = 30.0;
    return height;

}

- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)rowIndex {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName: ClickedTableViewRow object: self.tableView userInfo: @{@"clickedRow": [NSNumber numberWithInteger:rowIndex]}];
    return YES;
}


@end
