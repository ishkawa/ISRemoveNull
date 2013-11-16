#import "NSArray+RemoveNull.h"
#import "NSDictionary+RemoveNull.h"

@implementation NSArray (RemoveNull)

- (id)arrayByRemovingNull
{
    return [self arrayByRemovingNullRecursively:YES];
}

- (id)arrayByRemovingNullRecursively:(BOOL)recursive
{
    NSMutableArray *array = [self mutableCopy];
    
    for (id object in self) {
        if (object == [NSNull null]) {
            [array removeObject:object];
        }
        
        if (recursive) {
            if ([object isKindOfClass:[NSDictionary class]]) {
                NSInteger index = [array indexOfObject:object];
                NSDictionary *subdictionary = [object dictionaryByRemovingNullRecursively:YES];
                [array replaceObjectAtIndex:index withObject:subdictionary];
            }
            
            if ([object isKindOfClass:[NSArray class]]) {
                NSInteger index = [array indexOfObject:object];
                NSArray *subarray = [object arrayByRemovingNullRecursively:YES];
                [array replaceObjectAtIndex:index withObject:subarray];
            }
        }
    }
    
    return [array copy];
}

@end
