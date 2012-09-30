#import "NSDictionary+RemoveNull.h"
#import "NSArray+RemoveNull.h"

@implementation NSDictionary (RemoveNull)

- (id)dictionaryByRemovingNull
{
    return [self dictionaryByRemovingNullRecursively:YES];
}

- (id)dictionaryByRemovingNullRecursively:(BOOL)recursive
{
    NSMutableDictionary *validated = [NSMutableDictionary dictionaryWithDictionary:self];
    
    for (id key in [self allKeys]) {
        id item = [self objectForKey:key];
        
        if ([item isKindOfClass:[NSNull class]]) {
            [validated removeObjectForKey:key];
        }
        if (recursive) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                NSDictionary *validatedItem = [item dictionaryByRemovingNullRecursively:YES];
                [validated setValue:validatedItem forKey:key];
            }
            
            if ([item isKindOfClass:[NSArray class]]) {
                NSArray *validatedItem = [item arrayByRemovingNullRecursively:YES];
                [validated setValue:validatedItem forKey:key];
            }
        }
    }
    
    return [NSDictionary dictionaryWithDictionary:validated];
}

@end
