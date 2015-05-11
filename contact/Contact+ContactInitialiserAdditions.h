//
//  Contact+ContactInitialiserAdditions.h
//  contact
//
//  Created by Discovery on 2015/04/29.
//  Copyright (c) 2015 Discovery. All rights reserved.
//

#import "Contact.h"

@interface Contact (ContactInitialiserAdditions)
- (id)initFromDictionary:(NSDictionary*)dictionary;
@end
