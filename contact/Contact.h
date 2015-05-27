//
//  Contact.h
//  contact
//
//  Created by Elsabe Ros on 2015/05/27.
//  Copyright (c) 2015 Elsabe Ros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Contact : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSDate * birthDate;
@property (nonatomic, retain) NSString * phoneNumber;
@property (nonatomic, retain) NSString * email;

@end
