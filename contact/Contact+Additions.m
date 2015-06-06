//
//  Contact+Additions.m
//  contact
//
//  Created by Elsabe Ros on 2015/05/27.
//  Copyright (c) 2015 Elsabe Ros. All rights reserved.
//

#import "Contact+Additions.h"
#import "AppDelegate.h"

@implementation Contact (Additions)

-(NSString*) fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

-(NSString*) description {
    NSString* descr = [NSString stringWithFormat:@"Name: %@, Birthday: %@, Phone: %@, Email: %@", self.fullName, self.birthDate, self.phoneNumber, self.email];
    return descr;
}

- (NSString*) sectionKey {
    return [[self.lastName uppercaseString] substringToIndex:1];
}

@end
