//
//  TodoViewController.h
//  Todo
//
//  Created by Jayesh Shah on 8/4/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\jayeshs. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TodoTableViewCell;

@interface TodoViewController : UITableViewController <UITextFieldDelegate>
{
   
}

@property (nonatomic, weak) UITableView *myTableView;

@property (nonatomic, retain) NSMutableArray *todoStrings;
@property (nonatomic, assign) IBOutlet TodoTableViewCell *todoTableViewCell;

@end
