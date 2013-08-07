//
//  TodoViewController.m
//  Todo
//
//  Created by Jayesh Shah on 8/4/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\jayeshs. All rights reserved.
//

#import "TodoViewController.h"
#import "TodoTableViewCell.h"

@interface TodoViewController ()
{
      NSMutableArray *todoStrings;
}


-(void)addButtonPressed;
-(void)updateRowTags;


@end

@implementation TodoViewController
@synthesize todoStrings;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    todoStrings = [[NSMutableArray alloc] initWithObjects:nil];
    self.title = @"Todo list";
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStyleBordered target:self action:@selector(addButtonPressed)];
    self.navigationItem.rightBarButtonItem = addButton;

    
    //[self.myTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [todoStrings count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TodoTableViewCell";
    TodoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TodoTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.textField = [[UITextField alloc] init];
    cell.textField.text = [todoStrings objectAtIndex:indexPath.row];
    cell.textField.tag = indexPath.row;
    [cell.textField setBorderStyle:UITextBorderStyleNone];
    NSLog(@"index path %@", cell.textField.text);
    cell.textField.delegate = self;
        
    // Configure the cell...
    
    return cell;
}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    
    [super setEditing:editing animated:animated];
//	self.navigationItem.rightBarButtonItem.enabled = !editing;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [todoStrings removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    [self performSelector:@selector(updateRowTags) withObject:nil afterDelay:0.0];
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    
    NSString* fromString = [todoStrings objectAtIndex:fromIndexPath.row];
    NSString* toString = [todoStrings objectAtIndex:toIndexPath.row];
    
    [todoStrings replaceObjectAtIndex:fromIndexPath.row withObject:fromString];
    [todoStrings replaceObjectAtIndex:toIndexPath.row withObject:toString];
    
      
}


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)updateRowTags {
	NSArray *visibleCells = [self.tableView visibleCells];
	for (TodoTableViewCell *cell in visibleCells) {
		NSInteger tag = [[self.tableView indexPathForCell:cell] row];
		cell.textField.tag = tag;
    }
}



- (void)addButtonPressed
{
    [todoStrings insertObject:@"" atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
	
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self updateRowTags];
    //[self setEditing:YES animated:YES];
	TodoTableViewCell *cell = (TodoTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
	[cell.textField becomeFirstResponder];
    
   // [self.tableView reloadData];
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
	
	NSString *str = [todoStrings objectAtIndex:textField.tag];
	str = textField.text;
	
    NSLog(@"Jayesh %@", str);
	return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
	// Ensure that a text field for a row for a newly-inserted object is disabled when the user finishes editing.
	//textField.enabled = self.editing;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
