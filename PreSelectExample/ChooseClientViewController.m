//
//  ChooseClientViewController.m
//  PreSelectExample
//
//  Created by Don Mag on 9/5/21.
//  Copyright © 2021 Don Mag. All rights reserved.
//

#import "ChooseClientViewController.h"
#import "ClientTableViewController.h"

@interface ChooseClientViewController ()

{
	NSArray *singleRowToSelect;
	NSArray *multipleRowsToSelect;
	UIStackView *singleStack;
	UIStackView *multiStack;
}

@end

@implementation ChooseClientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	singleRowToSelect = @[
		@[@2],
		@[@5],
		@[@17],
	];
	
	multipleRowsToSelect = @[
		@[@3, @4, @7],
		@[@2, @5, @13],
		@[@1, @6, @13, @18],
	];
	
	singleStack = [UIStackView new];
	singleStack.axis = UILayoutConstraintAxisVertical;
	singleStack.spacing = 20.0;
	
	multiStack = [UIStackView new];
	multiStack.axis = UILayoutConstraintAxisVertical;
	multiStack.spacing = 20.0;
	
	UIStackView *outerStack = [UIStackView new];
	outerStack.axis = UILayoutConstraintAxisVertical;
	outerStack.spacing = 8.0;
	outerStack.translatesAutoresizingMaskIntoConstraints = NO;
	
	UILabel *v =  [UILabel new];
	v.text = @"Row to pre-select for\nSingle-Select TableView";
	v.textAlignment = NSTextAlignmentCenter;
	v.numberOfLines = 0;
	
	[outerStack addArrangedSubview:v];
	[outerStack addArrangedSubview:singleStack];

	v =  [UILabel new];
	v.text = @"Rows to pre-select for\nMulti-Select TableView";
	v.textAlignment = NSTextAlignmentCenter;
	v.numberOfLines = 0;

	[outerStack addArrangedSubview:v];
	[outerStack addArrangedSubview:multiStack];

	for (NSArray *a in singleRowToSelect) {
		UIButton *b = [UIButton new];
		NSString *t = [a componentsJoinedByString:@" + "];
		[b setTitle:t forState:UIControlStateNormal];
		[b setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[b setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
		[b setBackgroundColor:[UIColor systemBlueColor]];
		[b addTarget:self action:@selector(singleBtnTapped:) forControlEvents:UIControlEventTouchUpInside];
		[singleStack addArrangedSubview:b];
	}
	
	for (NSArray *a in multipleRowsToSelect) {
		UIButton *b = [UIButton new];
		NSString *t = [a componentsJoinedByString:@" + "];
		[b setTitle:t forState:UIControlStateNormal];
		[b setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[b setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
		[b setBackgroundColor:[UIColor systemRedColor]];
		[b addTarget:self action:@selector(multiBtnTapped:) forControlEvents:UIControlEventTouchUpInside];
		[multiStack addArrangedSubview:b];
	}
	
	[outerStack setCustomSpacing:40.0 afterView:singleStack];
	[self.view addSubview:outerStack];
	
	UILayoutGuide *g = [self.view safeAreaLayoutGuide];
	
	[NSLayoutConstraint activateConstraints:@[
		
		[outerStack.topAnchor constraintEqualToAnchor:g.topAnchor constant:40.0],
		[outerStack.leadingAnchor constraintEqualToAnchor:g.leadingAnchor constant:40.0],
		[outerStack.trailingAnchor constraintEqualToAnchor:g.trailingAnchor constant:-40.0],
		[outerStack.centerXAnchor constraintEqualToAnchor:g.centerXAnchor],
		
	]];

	
}

- (void)singleBtnTapped:(UIButton *)btn {
	NSInteger idx = [singleStack.arrangedSubviews indexOfObject:btn];
	
	ClientTableViewController *vc = [ClientTableViewController new];
	
	[vc setAllowMutliSelect:NO];
	[vc setPreSelectedRows:singleRowToSelect[idx]];
	
	[self.navigationController pushViewController:vc animated:YES];
}

- (void)multiBtnTapped:(UIButton *)btn {
	NSInteger idx = [multiStack.arrangedSubviews indexOfObject:btn];
	
	ClientTableViewController *vc = [ClientTableViewController new];
	
	[vc setAllowMutliSelect:YES];
	[vc setPreSelectedRows:multipleRowsToSelect[idx]];
	
	[self.navigationController pushViewController:vc animated:YES];
}

@end
