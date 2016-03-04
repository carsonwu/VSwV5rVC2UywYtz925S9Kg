//
//  Aftership_SDK_iOSTests.m
//  Aftership-SDK-iOSTests
//
//  Created by 邦成 吴 on 1/3/2016.
//  Copyright © 2016 carson. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AftershipSDK.h"

#define API_KEY       @"4d396a35-bcd8-4186-befb-460f877a7c5a"

@interface Aftership_SDK_iOSTests : XCTestCase{
    AftershipApiManager *manager;
    AftershipTracking *tracking001;
}

@end

@implementation Aftership_SDK_iOSTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    manager = [AftershipApiManager managerWithApiKey:API_KEY];
    
    //create a common tracking instance for create/get tracking api test, if want to test another tracking, just modify the properties below.
    tracking001 = [[AftershipTracking alloc] init];
    tracking001.trackingNumber = @"4409020020";
    tracking001.slug = @"dhl";
    tracking001.emails = @[@"test@123.com", @"case@456.com"];
    tracking001.title = @"test title";
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    manager = nil;
    tracking001 = nil;
}

//- (void)testCreateTrackingApi{
//    XCTestExpectation *expectation = [self expectationWithDescription:@"create tracking request"];
//    //create a tracking
//    
//    AftershipCreateTrackingRequest *request = [AftershipCreateTrackingRequest requestWithTracking:tracking001 completionBlock:^(AftershipCreateTrackingRequest *request, id result, NSError *error) {
//        NSDictionary *dict = (NSDictionary*)result;
//        NSLog(@"%@", dict);
//        XCTAssertNil(error,@"Failt to create tracking: Reason: %@", error.description);
//        XCTAssertNotNil(dict[@"rate_limit_info"], @"No rate limit data");
//        XCTAssertNotNil(dict[@"tracking"], @"No tracking data");
//        XCTAssertEqualObjects(dict[@"tracking"][@"tracking_number"], tracking001.trackingNumber, @"tracking number is mismatched");
//        XCTAssertEqualObjects(dict[@"tracking"][@"slug"], tracking001.slug, @"slug is mismatched");
//        XCTAssertEqualObjects(dict[@"tracking"][@"emails"], tracking001.emails, @"emails are mismatched");
//        XCTAssertEqualObjects(dict[@"tracking"][@"title"], tracking001.title, @"title is mismatched");
//        [expectation fulfill];
//    }];
//    [manager performRequest:request];
//    
//    [self waitForExpectationsWithTimeout:30.0 handler:nil];
//}

- (void)testGetTrackingApi{
    XCTestExpectation *expectation = [self expectationWithDescription:@"get tracking request"];
    AftershipGetTrackingRequest *request = [AftershipGetTrackingRequest requestWithTrackingNumber:tracking001.trackingNumber slug:tracking001.slug completionBlock:^(AftershipGetTrackingRequest *request, id result, NSError *error) {
        NSDictionary *dict = (NSDictionary*)result;
        NSLog(@"%@", dict);
        XCTAssertNil(error,@"Failt to get tracking: Reason: %@", error.description);
        XCTAssertNotNil(dict[@"rate_limit_info"], @"No rate limit data");
        XCTAssertNotNil(dict[@"tracking"], @"No tracking data");
        XCTAssertEqualObjects(dict[@"tracking"][@"tracking_number"], tracking001.trackingNumber, @"tracking number is mismatched");
        XCTAssertEqualObjects(dict[@"tracking"][@"slug"], tracking001.slug, @"slug is mismatched");
        XCTAssertEqualObjects(dict[@"tracking"][@"emails"], tracking001.emails, @"emails are mismatched");
        XCTAssertEqualObjects(dict[@"tracking"][@"title"], tracking001.title, @"title is mismatched");
        [expectation fulfill];
    }];
    [manager performRequest:request];
    [self waitForExpectationsWithTimeout:30.0 handler:nil];
}

@end
