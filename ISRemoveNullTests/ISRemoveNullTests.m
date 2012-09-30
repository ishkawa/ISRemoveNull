#import "ISRemoveNullTests.h"
#import "ISRemoveNull.h"

@implementation ISRemoveNullTests

#pragma mark - tests

- (void)testRemoveNullInDictionary
{
    NSDictionary *valid = @{
        @"hoge" : @"hoge",
        @"fuga" : @"fuga",
        @"piyo" : @"piyo",
    };
    
    NSDictionary *invalid = @{
        @"hoge" : @"hoge",
        @"fuga" : @"fuga",
        @"null" : [NSNull null],
        @"piyo" : @"piyo",
    };
    
    STAssertEqualObjects([invalid dictionaryByRemovingNull], valid, nil);
}

- (void)testRemoveNullInNestedDictionary
{
    NSDictionary *subValid = @{
        @"hoge" : @"hoge",
        @"fuga" : @"fuga",
        @"piyo" : @"piyo",
    };
    
    NSDictionary *subInvalid = @{
        @"hoge" : @"hoge",
        @"fuga" : @"fuga",
        @"null" : [NSNull null],
        @"piyo" : @"piyo",
    };
    
    NSDictionary *valid = @{
        @"hoge" : @"hoge",
        @"fuga" : @"fuga",
        @"piyo" : @"piyo",
        @"nest" : subValid
    };
    
    NSDictionary *invalid = @{
        @"hoge" : @"hoge",
        @"fuga" : @"fuga",
        @"null" : [NSNull null],
        @"piyo" : @"piyo",
        @"nest" : subInvalid
    };
    
    STAssertEqualObjects([invalid dictionaryByRemovingNull], valid, nil);
}

- (void)testRemoveNullInDictionaryInArray
{
    NSDictionary *subValid = @{
        @"hoge" : @"hoge",
        @"fuga" : @"fuga",
        @"piyo" : @"piyo",
    };
    
    NSDictionary *subInvalid = @{
        @"hoge" : @"hoge",
        @"fuga" : @"fuga",
        @"null" : [NSNull null],
        @"piyo" : @"piyo",
    };
    
    NSArray *valid = @[ @"hoge", @"fuga", subValid, @"piyo" ];
    NSArray *invalid = @[ @"hoge", @"fuga", [NSNull null], subInvalid, @"piyo" ];
    
    STAssertEqualObjects([invalid arrayByRemovingNull], valid, nil);
}

- (void)testRemoveNullInArray
{
    NSArray *valid = @[ @"hoge", @"fuga", @"piyo" ];
    NSArray *invalid = @[ @"hoge", @"fuga", [NSNull null], @"piyo" ];
    
    STAssertEqualObjects([invalid arrayByRemovingNull], valid, nil);
}

- (void)testRemoveNullInNestedArray
{
    NSArray *valid = @[ @"hoge", @[@"hoge", @"fuga", @"piyo"]];
    NSArray *invalid = @[ @"hoge", @[@"hoge", @"fuga", [NSNull null], @"piyo"]];
    
    STAssertEqualObjects([invalid arrayByRemovingNull], valid, nil);
}

- (void)testRemoveNullInArrayInDictionary
{
    NSDictionary *valid = @{
        @"hoge" : @"hoge",
        @"fuga" : @"fuga",
        @"piyo" : @"piyo",
        @"nest" : @[ @"hoge", @"fuga", @"piyo" ]
    };
    
    NSDictionary *invalid = @{
        @"hoge" : @"hoge",
        @"fuga" : @"fuga",
        @"null" : [NSNull null],
        @"piyo" : @"piyo",
        @"nest" : @[ @"hoge", @"fuga", [NSNull null], @"piyo" ]
    };
    
    STAssertEqualObjects([invalid dictionaryByRemovingNull], valid, nil);
}

@end
