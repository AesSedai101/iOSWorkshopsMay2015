//
//  ContactChangeDelegateTestCase.m
//  contact
//
//  Created by Discovery on 2015/04/29.
//  Copyright (c) 2015 Discovery. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ContactChangeDelegate.h"
#import "Contact.h"

@interface ContactChangeDelegateTestCase : XCTestCase

@end

@interface TestDelegate : NSObject <ContactChangeDelegate>

@end

@implementation TestDelegate

-(void) didChangeContact:(Contact *)contact {
    NSLog(@"Contact changed: %@", [contact description]);
}

@end

@implementation ContactChangeDelegateTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    TestDelegate * td = [[TestDelegate alloc] init];
    Contact* contact = [Contact contactWithFirstName:@"First" andLastName:@"Last"];
    contact.delegate = td;
    
    contact.phoneNumber = @"0123456789";
    contact.email = @"mail@mail.com";
    
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

@end
