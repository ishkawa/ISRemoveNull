#import <XCTest/XCTest.h>
#import "ISRemoveNull.h"

@interface ISRemoveNullTests : XCTestCase

@end

@implementation ISRemoveNullTests

#pragma mark - tests

- (void)testRemoveNullInDictionary
{
    NSDictionary *dictionary = @{
        @"hoge": @"hoge",
        @"fuga": @"fuga",
        @"null": [NSNull null],
        @"piyo": @"piyo",
    };
    
    NSDictionary *expectedDictionary = @{
        @"hoge": @"hoge",
        @"fuga": @"fuga",
        @"piyo": @"piyo",
    };
    
    XCTAssertEqualObjects([dictionary dictionaryByRemovingNull], expectedDictionary);
}

- (void)testRemoveNullInNestedDictionary
{
    NSDictionary *dictionary = @{
        @"hoge": @"hoge",
        @"fuga": @"fuga",
        @"null": [NSNull null],
        @"piyo": @"piyo",
        @"nest": @{
            @"hoge": @"hoge",
            @"fuga": @"fuga",
            @"null": [NSNull null],
            @"piyo": @"piyo",
        },
    };
    
    NSDictionary *expectedDictionary = @{
        @"hoge": @"hoge",
        @"fuga": @"fuga",
        @"piyo": @"piyo",
        @"nest": @{
            @"hoge": @"hoge",
            @"fuga": @"fuga",
            @"piyo": @"piyo",
        },
    };
    
    XCTAssertEqualObjects([dictionary dictionaryByRemovingNull], expectedDictionary);
}

- (void)testRemoveNullInDictionaryInArray
{
    NSDictionary *dictionary = @{
        @"hoge": @"hoge",
        @"fuga": @"fuga",
        @"null": [NSNull null],
        @"piyo": @"piyo",
    };
    
    NSDictionary *expectedDictionary = @{
        @"hoge": @"hoge",
        @"fuga": @"fuga",
        @"piyo": @"piyo",
    };
    
    NSArray *array = @[@"hoge", @"fuga", [NSNull null], dictionary, @"piyo"];
    NSArray *expectedArray = @[@"hoge", @"fuga", expectedDictionary, @"piyo"];
    
    XCTAssertEqualObjects([array arrayByRemovingNull], expectedArray);
}

- (void)testRemoveNullInArray
{
    NSArray *array = @[@"hoge", @"fuga", [NSNull null], @"piyo"];
    NSArray *expectedArray = @[@"hoge", @"fuga", @"piyo"];
    
    XCTAssertEqualObjects([array arrayByRemovingNull], expectedArray);
}

- (void)testRemoveNullInNestedArray
{
    NSArray *array = @[@"hoge", @[@"hoge", @"fuga", [NSNull null], @"piyo"]];
    NSArray *expectedArray = @[@"hoge", @[@"hoge", @"fuga", @"piyo"]];
    
    XCTAssertEqualObjects([array arrayByRemovingNull], expectedArray);
}

- (void)testRemoveNullInArrayInDictionary
{
    NSDictionary *dictionary = @{
        @"hoge": @"hoge",
        @"fuga": @"fuga",
        @"null": [NSNull null],
        @"piyo": @"piyo",
        @"nest": @[@"hoge", @"fuga", [NSNull null], @"piyo"]
    };
    
    NSDictionary *expectedDictionary = @{
        @"hoge": @"hoge",
        @"fuga": @"fuga",
        @"piyo": @"piyo",
        @"nest": @[@"hoge", @"fuga", @"piyo"]
    };
    
    XCTAssertEqualObjects([dictionary dictionaryByRemovingNull], expectedDictionary);
}

@end
