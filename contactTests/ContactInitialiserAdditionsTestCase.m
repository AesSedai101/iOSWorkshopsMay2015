//
//  ContactInitialiserAdditions.m
//  contact
//
//  Created by Discovery on 2015/04/29.
//  Copyright (c) 2015 Discovery. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Contact.h"
#import "Contact+ContactInitialiserAdditions.h"

@interface ContactInitialiserAdditionsTestCase : XCTestCase

@end

@implementation ContactInitialiserAdditionsTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionaryInit {
    NSDictionary* vals = @{@"firstName":@"Steve",@"lastName":@"Woz",@"email":@"a@b.c",@"phone":@"012 345 6789",@"birth":@"1 Jan 1970"};
    Contact* contact = [[Contact alloc] initFromDictionary:vals];
    XCTAssertEqualObjects(@"Steve Woz", contact.fullName);
    XCTAssertEqualObjects(@"a@b.c", contact.email);
    XCTAssertEqualObjects(@"012 345 6789", contact.phoneNumber);
    XCTAssertTrue(contact.birthDate.timeIntervalSince1970 == 0);
}


@end
