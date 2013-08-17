# ISRemoveNull [![Build Status](https://travis-ci.org/ishkawa/ISRemoveNull.png?branch=master)](https://travis-ci.org/ishkawa/ISRemoveNull)

ISRemoveNull is extension to remove `NSNull` from `NSDictionary` and `NSArray`.  

## Usage

- add files in ISRemoveNull
- import `ISRemoveNull.h` in `prefix.pch`
- remove NSNull from NSDictionary

```objectivec
NSDictionary *invalid = @{
    @"hoge" : @"hoge",
    @"fuga" : @"fuga",
    @"null" : [NSNull null],
    @"piyo" : @"piyo",
};

NSDictionary *valid = [invalid dictionaryByRemovingNull];
```

result:

```objectivec
@{
    @"hoge" : @"hoge",
    @"fuga" : @"fuga",
    @"piyo" : @"piyo",
};
```

- remove NSNull from NSDictionary

```objectivec
NSArray *invalid = @[ @"hoge", @"fuga", [NSNull null], @"piyo" ];
NSArray *valid = [invalid arrayByRemovingNull];
```

result:

```objectivec
@[ @"hoge", @"fuga", @"piyo" ];
```

## License

MIT
