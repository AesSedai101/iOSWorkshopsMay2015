//
//  Contact+Additions.m
//  contact
//
//  Created by Elsabe Ros on 2015/05/27.
//  Copyright (c) 2015 Elsabe Ros. All rights reserved.
//

#import "Contact+Additions.h"

@implementation Contact (Additions)

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
