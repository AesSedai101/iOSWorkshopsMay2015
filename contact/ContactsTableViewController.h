//
//  ContactsTableViewController.h
//  contact
//
//  Created by Elsabe Ros on 2015/05/27.
//  Copyright (c) 2015 Elsabe Ros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "ContactChangeDelegate.h"

@interface ContactsTableViewController : UITableViewController <ContactChangeDelegate,NSFetchedResultsControllerDelegate>

@end
