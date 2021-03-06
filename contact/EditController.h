//
//  EditController.h
//  contact
//
//  Created by Discovery on 2015/05/11.
//  Copyright (c) 2015 Discovery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
#import "ContactChangeDelegate.h"

@interface EditController : UIViewController
@property Contact* contact;
@property (weak, nonatomic) id <ContactChangeDelegate> delegate;
@end
