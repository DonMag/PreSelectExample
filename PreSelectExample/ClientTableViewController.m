//
//  ClientTableViewController.m
//  PreSelectExample
//
//  Created by Don Mag on 9/5/21.
//  Copyright © 2021 Don Mag. All rights reserved.
//

#import "ClientTableViewController.h"
#import "ClientTableViewCell.h"

@interface ClientObject : NSObject
@property (strong, nonatomic) NSString *name;
@property (assign, readwrite) BOOL selected;
@end
@implementation ClientObject
@end

@interface ClientTableViewController ()
{
	NSMutableArray <ClientObject *>*clientData;
}
@end

@implementation ClientTableViewController

static NSString *clientTableIdentifier = @"ClientTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// some sample data
	NSArray *names = @[
		@"Alexander",
		@"Anthony",
		@"Bella",
		@"Brian",
		@"Carolyn",
		@"Charles",
		@"Christian",
		@"Colin",
		@"Colin",
		@"Dominic",
		@"Grace",
		@"Harry",
		@"Ian",
		@"Jan",
		@"Jasmine",
		@"Jessica",
		@"Jonathan",
		@"Keith",
		@"Nathan",
		@"Nicola",
		@"Oliver",
		@"Oliver",
		@"Penelope",
		@"Sebastian",
		@"Trevor",
		@"Victor",
		@"Wanda",
		@"Wanda",
		@"Wendy",
		@"Yvonne",
	];

	clientData = [NSMutableArray new];
	for (NSString *s in names) {
		ClientObject *ob = [ClientObject new];
		// let's prefix the names with row number
		//	to make it easier to confirm correct pre-selections
		ob.name = [NSString stringWithFormat:@"%lu - %@", (unsigned long)clientData.count, s];
		// all objects initially NOT selected
		ob.selected = NO;
		[clientData addObject:ob];
	}
	// set .selected property for rows we're going to pre-select
	for (NSNumber *n in _preSelectedRows) {
		clientData[[n integerValue]].selected = YES;
	}
	
	[self.tableView registerClass:ClientTableViewCell.class forCellReuseIdentifier:clientTableIdentifier];
	
	self.tableView.allowsMultipleSelection = _allowMutliSelect;
}

- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
	
	// viewDidLayoutSubviews is called many times during controller lifecycle
	// so we only want to do this ONCE
	if (_preSelectedRows) {
		for (NSNumber *n in _preSelectedRows) {
			NSIndexPath *p = [NSIndexPath indexPathForRow:[n integerValue] inSection:0];
			[self.tableView selectRowAtIndexPath:p animated:NO scrollPosition:UITableViewScrollPositionNone];
		}
		// clear the array so we don't call this again
		_preSelectedRows = nil;
	}

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return clientData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ClientTableViewCell *cell = (ClientTableViewCell *)[tableView dequeueReusableCellWithIdentifier:clientTableIdentifier forIndexPath:indexPath];

	// we only need to set the name, because the cell class will handle
	//	visual appearance when selected
	cell.textLabel.text = clientData[indexPath.row].name;

	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	// update our data source
	clientData[indexPath.row].selected = YES;
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
	// update our data source
	clientData[indexPath.row].selected = NO;
}

@end
