#import "NSArray+RemoveNull.h"
#import "NSDictionary+RemoveNull.h"

@implementation NSArray (RemoveNull)

- (id)arrayByRemovingNull
{
    return [self arrayByRemovingNullRecursively:YES];
}

- (id)arrayByRemovingNullRecursively:(BOOL)recursive
{
    NSMutableArray *nullItems = [NSMutableArray array];
    NSMutableArray *validated = [NSMutableArray arrayWithArray:self];
    
    for (id item in self) {
        if ([item isKindOfClass:[NSNull class]]) {
            [nullItems addObject:item];
        }
        
        if (recursive) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                NSDictionary *validatedItem = [item dictionaryByRemovingNullRecursively:YES];
                [validated replaceObjectAtIndex:[validated indexOfObject:item]
                                     withObject:validatedItem];
            }
            
            if ([item isKindOfClass:[NSArray class]]) {
                NSArray *validatedItem = [item arrayByRemovingNullRecursively:YES];
                [validated replaceObjectAtIndex:[validated indexOfObject:item]
                                     withObject:validatedItem];
            }
        }
    }
    [validated removeObjectsInArray:nullItems];
    
    return [NSArray arrayWithArray:validated];
}

@end
