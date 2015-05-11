//
//  Contact+ContactInitialiserAdditions.m
//  contact
//
//  Created by Discovery on 2015/04/29.
//  Copyright (c) 2015 Discovery. All rights reserved.
//

#import "Contact+ContactInitialiserAdditions.h"

@implementation Contact (ContactInitialiserAdditions)

-(id) initFromDictionary:(NSDictionary*) dictionary {
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
    
    return [self init];
}

@end
