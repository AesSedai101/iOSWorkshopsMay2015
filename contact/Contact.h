//
//  Contact.h
//  contact
//
//  Created by Discovery on 2015/04/24.
//  Copyright (c) 2015 Discovery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property NSDate* birthDate;
@property NSString* firstName;
@property NSString* lastName;
@property NSString* phoneNumber;
@property NSString* email;
@property (readonly) NSString* fullName;

+(id) contactWithFirstName:(NSString*) firstName andLastName:(NSString*) lastName;

@end
