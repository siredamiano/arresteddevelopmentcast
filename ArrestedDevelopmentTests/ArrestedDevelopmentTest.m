//
//  ArrestedDevelopmentTest.m
//  ArrestedDevelopment
//
//  Created by Damian A Torres on 2/1/15.
//  Copyright (c) 2015 tsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "CastItem.h"
#import "Utils.h"

@interface ArrestedDevelopmentTest : XCTestCase

@end

@implementation ArrestedDevelopmentTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testCastItemObjectCreationNotNil {
    CastItem *item = [[CastItem alloc] init];
    XCTAssertNotNil(item, @"Object is not nil");
}

- (void)testActualDateFormatter {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/YYYY"];
    NSDate *now = [[NSDate alloc] init];
    
    NSString *date = [dateFormatter stringFromDate:now];
    
    XCTAssertTrue([date isEqualToString:[Utils actualDate]], @"Dates are equal.");

}


- (void) testThumbnailFromImageObjectEquals {
    
    UIImage *image = [UIImage imageNamed:@"arrested-development-logo"];
    
    UIImage *thumbnail = [Utils setThumbnailFromImage:image];
    
    XCTAssertTrue([thumbnail isKindOfClass:[UIImage class]], @"UIImage created from setThumbnailFromImage method is a instance of UIImage");
    
}



- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
