#import <Foundation/Foundation.h>

@interface NSDictionary (RemoveNull)

- (id)dictionaryByRemovingNull;
- (id)dictionaryByRemovingNullRecursively:(BOOL)recursive;

@end
