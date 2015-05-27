//
//  EditController.h
//  contact
//
//  Created by Elsabe Ros on 2015/05/27.
//  Copyright (c) 2015 Elsabe Ros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact+Validation.h"
#import "ContactChangeDelegate.h"

@interface EditController : UIViewController
@property Contact* contact;
@property (weak, nonatomic) id <ContactChangeDelegate> delegate;
@end
