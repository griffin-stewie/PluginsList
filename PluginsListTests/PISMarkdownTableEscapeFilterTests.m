//
//  PISMarkdownTableEscapeFilterTests.m
//  PluginsListTests
//
//  Created by griffin-stewie on 2019/09/27.
//  Copyright © 2019 cyan-stivy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PISMarkdownTableEscapeFilter.h"

@interface PISMarkdownTableEscapeFilterTests : XCTestCase

@end

@implementation PISMarkdownTableEscapeFilterTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample
{
    PISMarkdownTableEscapeFilter *filter = [[PISMarkdownTableEscapeFilter alloc] init];

    NSArray <NSDictionary <NSString *, NSString *>*>*tab = @[
        @{
            @"value": @"あいう",
            @"expected": @"あいう",
        },
        @{
            @"value": @"あ|いう",
            @"expected": @"あ\\|いう",
        },
    ];

    for (NSDictionary <NSString *, NSString *> *dict in tab) {
        id result = [filter transformedValue:dict[@"value"]];

        XCTAssertEqualObjects(result, dict[@"expected"], @"should be equal");
    }
}

@end
