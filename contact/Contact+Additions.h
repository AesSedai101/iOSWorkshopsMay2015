//
//  Contact+Additions.h
//  contact
//
//  Created by Elsabe Ros on 2015/05/27.
//  Copyright (c) 2015 Elsabe Ros. All rights reserved.
//

#import "Contact.h"

@interface Contact (Additions)
@property (readonly) NSString* fullName;

- (id)initFromDictionary:(NSDictionary*)dictionary;
+ (id)contactWithFirstName:(NSString*) firstName andLastName:(NSString*) lastName;
@end
