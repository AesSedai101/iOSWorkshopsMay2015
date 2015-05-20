//
//  ViewController.h
//  contact
//
//  Created by Discovery on 2015/04/24.
//  Copyright (c) 2015 Discovery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
#import "ContactChangeDelegate.h"

@interface ViewController : UIViewController <ContactChangeDelegate>
@property Contact* contact;
@property (weak, nonatomic) id <ContactChangeDelegate> delegate;
@end

