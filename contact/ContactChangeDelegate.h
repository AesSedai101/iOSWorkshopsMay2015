//
//  ContactChangeDelegate.h
//  contact
//
//  Created by Discovery on 2015/04/29.
//  Copyright (c) 2015 Discovery. All rights reserved.
//

#import <Foundation/Foundation.h>

// Forward declaration because import loops
@class Contact;

@protocol ContactChangeDelegate <NSObject>
-(void)didChangeContact:(Contact *)contact;
@end
