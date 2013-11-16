#import "ISRemoveNullTests.h"
#import "ISRemoveNull.h"

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
    
    STAssertEqualObjects([dictionary dictionaryByRemovingNull], expectedDictionary, nil);
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
    
    STAssertEqualObjects([dictionary dictionaryByRemovingNull], expectedDictionary, nil);
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
    
    STAssertEqualObjects([array arrayByRemovingNull], expectedArray, nil);
}

- (void)testRemoveNullInArray
{
    NSArray *array = @[@"hoge", @"fuga", [NSNull null], @"piyo"];
    NSArray *expectedArray = @[@"hoge", @"fuga", @"piyo"];
    
    STAssertEqualObjects([array arrayByRemovingNull], expectedArray, nil);
}

- (void)testRemoveNullInNestedArray
{
    NSArray *array = @[@"hoge", @[@"hoge", @"fuga", [NSNull null], @"piyo"]];
    NSArray *expectedArray = @[@"hoge", @[@"hoge", @"fuga", @"piyo"]];
    
    STAssertEqualObjects([array arrayByRemovingNull], expectedArray, nil);
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
    
    STAssertEqualObjects([dictionary dictionaryByRemovingNull], expectedDictionary, nil);
}

@end
