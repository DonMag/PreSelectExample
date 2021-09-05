//
//  ClientTableViewController.h
//  PreSelectExample
//
//  Created by Don Mag on 9/5/21.
//  Copyright © 2021 Don Mag. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ClientTableViewController : UITableViewController

@property (strong, nonatomic) NSArray *preSelectedRows;
@property (assign, readwrite) BOOL allowMutliSelect;

@end

NS_ASSUME_NONNULL_END
