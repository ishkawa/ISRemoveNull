#import <Foundation/Foundation.h>

@interface NSArray (RemoveNull)

- (id)arrayByRemovingNull;
- (id)arrayByRemovingNullRecursively:(BOOL)recursive;

@end
