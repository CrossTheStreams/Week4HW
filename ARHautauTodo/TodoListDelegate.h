//
//  TodoListDataSource.h
//  ARHautauTodo
//
//  Created by Andrew Hautau on 2/12/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TodoList.h"

@interface TodoListDelegate : NSObject <NSTableViewDelegate, NSTableViewDataSource>

-(instancetype) initWithTableView:(NSTableView*) tableView;
-(void)updateTableViewWithTitles:(NSArray *)titles;


@end
