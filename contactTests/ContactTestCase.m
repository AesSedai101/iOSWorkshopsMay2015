//
//  ContactTestCase.m
//  contact
//
//  Created by Discovery on 2015/04/24.
//  Copyright (c) 2015 Discovery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Contact.h"

@interface ContactTestCase : XCTestCase

@end

@implementation ContactTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFullNameConstruction {
    Contact* contact = [Contact contactWithFirstName:@"first" andLastName:@"last"];
    NSString* fullName = contact.fullName;
    XCTAssertEqualObjects(fullName, @"first last");
}

- (void)testEmptyFirstName {
    Contact* contact = [[Contact alloc] init];
    NSString* firstName = @"";
    NSError* error = nil;
    BOOL success = [contact validateValue:&firstName forKey:@"firstName" error:&error];
    XCTAssertFalse(success);
    XCTAssertEqualObjects(@"first name invalid", [error localizedDescription]);
}

- (void)testNilFirstName {
    Contact* contact = [[Contact alloc] init];
    NSString* firstName = nil;
    NSError* error = nil;
    BOOL success = [contact validateValue:&firstName forKey:@"firstName" error:&error];
    XCTAssertFalse(success);
    XCTAssertEqualObjects(@"first name invalid", [error localizedDescription]);
}

- (void)testGoodFirstName {
    Contact* contact = [[Contact alloc] init];
    NSString* firstName = @"first";
    NSError* error = nil;
    BOOL success = [contact validateValue:&firstName forKey:@"firstName" error:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
}

- (void)testEmptyLastName {
    Contact* contact = [[Contact alloc] init];
    NSString* lastName = @"";
    NSError* error = nil;
    BOOL success = [contact validateValue:&lastName forKey:@"lastName" error:&error];
    XCTAssertFalse(success);
    XCTAssertEqualObjects(@"last name invalid", [error localizedDescription]);
}

- (void)testNilLastName {
    Contact* contact = [[Contact alloc] init];
    NSString* lastName = nil;
    NSError* error = nil;
    BOOL success = [contact validateValue:&lastName forKey:@"lastName" error:&error];
    XCTAssertFalse(success);
    XCTAssertEqualObjects(@"last name invalid", [error localizedDescription]);
}

- (void)testGoodLastName {
    Contact* contact = [[Contact alloc] init];
    NSString* lastName = @"last";
    NSError* error = nil;
    BOOL success = [contact validateValue:&lastName forKey:@"lastName" error:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
}

-(void) testValidEmail {
    Contact* contact = [[Contact alloc] init];
    NSString* email = @"test@mail.com";
    NSError* error = nil;
    BOOL success = [contact validateValue:&email forKey:@"email" error:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
}

-(void) testInvalidEmail {
    Contact* contact = [[Contact alloc] init];
    NSString* email = @"badmail";
    NSError* error = nil;
    BOOL success = [contact validateValue:&email forKey:@"email" error:&error];
    XCTAssertFalse(success);
    XCTAssertEqualObjects(@"email address invalid", [error localizedDescription]);
}

-(void) testDescription {
    // just to show it
    Contact* contact = [Contact contactWithFirstName:@"First" andLastName:@"Last"];
    contact.birthDate = [NSDate dateWithTimeIntervalSince1970:20000];
    contact.email = @"test@mail.com";
    contact.phoneNumber = @"012 345 6789";
    NSLog(@"%@", [contact description]);
}

@end
