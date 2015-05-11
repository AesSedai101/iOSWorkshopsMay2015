//
//  Contact.m
//  contact
//
//  Created by Discovery on 2015/04/24.
//  Copyright (c) 2015 Discovery. All rights reserved.
//

#import "Contact.h"

@implementation Contact

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

-(BOOL) validateFirstName:(NSString**) ioValue error:(NSError* __autoreleasing*) outError {
    if ([*ioValue length] == 0) { // calling length on nil will also return 0
        // set up error
        NSMutableDictionary* details = [NSMutableDictionary dictionary];
        [details setValue:@"first name invalid" forKey:NSLocalizedDescriptionKey];
        NSError* error = [NSError errorWithDomain:@"contact" code:100 userInfo:details];
        *outError = error;
        return NO;
    }
    return YES;
}

-(BOOL) validateLastName:(NSString**) ioValue error:(NSError* __autoreleasing*) outError {
    if ([*ioValue length] == 0) { // calling length on nil will also return 0
        // set up error
        NSMutableDictionary* details = [NSMutableDictionary dictionary];
        [details setValue:@"last name invalid" forKey:NSLocalizedDescriptionKey];
        NSError* error = [NSError errorWithDomain:@"contact" code:101 userInfo:details];
        *outError = error;
        return NO;
    }
    return YES;
}

-(BOOL) validateEmail:(NSString**) value error:(NSError* __autoreleasing*) error {
    NSString* emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    BOOL valid = [predicate evaluateWithObject:*value];
    if (valid) {
        return YES;
    }
    
    NSMutableDictionary* details = [NSMutableDictionary dictionary];
    [details setValue:@"email address invalid" forKey:NSLocalizedDescriptionKey];
    *error = [NSError errorWithDomain:@"contact" code:102 userInfo:details];
    return NO;
}


@end
