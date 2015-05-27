//
//  Contact.m
//  contact
//
//  Created by Elsabe Ros on 2015/05/27.
//  Copyright (c) 2015 Elsabe Ros. All rights reserved.
//

#import "Contact.h"


@implementation Contact

@dynamic firstName;
@dynamic lastName;
@dynamic birthDate;
@dynamic phoneNumber;
@dynamic email;

+(id) contactWithFirstName:(NSString*) firstName andLastName:(NSString*) lastName {
    return [[Contact alloc] initWithFirstName:firstName andLastName:lastName];
}

-(id) initWithFirstName:(NSString*) firstName andLastName:(NSString*) lastName {
    self.firstName = firstName;
    self.lastName = lastName;
    return [self init];
}

-(id) init {
    return [super init];
}

-(NSString*) fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

-(NSString*) description {
    NSString* descr = [NSString stringWithFormat:@"Name: %@, Birthday: %@, Phone: %@, Email: %@", self.fullName, self.birthDate, self.phoneNumber, self.email];
    return descr;
}

@end
