# ISRemoveNull [![Build Status](https://travis-ci.org/ishkawa/ISRemoveNull.png?branch=master)](https://travis-ci.org/ishkawa/ISRemoveNull) [![Coverage Status](https://coveralls.io/repos/ishkawa/ISRemoveNull/badge.png?branch=master)](https://coveralls.io/r/ishkawa/ISRemoveNull?branch=master)

ISRemoveNull is extension of NSArray and NSDictionary to remove NSNull from them.

## Usage

- add files under `ISRemoveNull/`
- import `ISRemoveNull.h`
- remove NSNull from NSDictionary

```objectivec
NSDictionary *dictionary = @{
    @"hoge": @"hoge",
    @"fuga": @"fuga",
    @"null": [NSNull null],
    @"piyo": @"piyo",
};

NSDictionary *strippedDictionary = [dictionary dictionaryByRemovingNull];
// result: @{
//     @"hoge" : @"hoge",
//     @"fuga" : @"fuga",
//     @"piyo" : @"piyo",
// };
```

- remove NSNull from NSArray

```objectivec
NSArray *array = @[ @"hoge", @"fuga", [NSNull null], @"piyo" ];
NSArray *strippedArray = [array arrayByRemovingNull];
// result: @[@"hoge", @"fuga", @"piyo"];
```

### Installation with CocoaPods

```
pod 'ISRemoveNull', :git => 'git@github.com:ishkawa/ISRemoveNull.git'
```

## License

Copyright (c) 2012-2013 Yosuke Ishikawa

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

