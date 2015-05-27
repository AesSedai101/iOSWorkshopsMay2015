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

-(id) initFromDictionary:(NSDictionary*) dictionary {
    AppDelegate* app = [[UIApplication sharedApplication] delegate];
    
    NSLog(@"Initting contact");
    self = [self initWithEntity:@"Contact" insertIntoManagedObjectContext:app.managedObjectContext];
    
    
    NSLog(@"First name %@", [dictionary objectForKey:@"firstName"]);
    self.firstName = [dictionary objectForKey:@"firstName"];
    self.lastName = [dictionary objectForKey:@"lastName"];
    self.email = [dictionary objectForKey:@"email"];
    self.phoneNumber = [dictionary objectForKey:@"phone"];
    
    //parse date
    NSString* dateString = [dictionary objectForKey:@"birth"];
    NSDateFormatter* format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd LLLL yyyy"];
    NSDate* date = [format dateFromString:dateString];
    
    self.birthDate = date;
    
    return self;
}

-(NSString*) fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

-(NSString*) description {
    NSString* descr = [NSString stringWithFormat:@"Name: %@, Birthday: %@, Phone: %@, Email: %@", self.fullName, self.birthDate, self.phoneNumber, self.email];
    return descr;
}

@end
