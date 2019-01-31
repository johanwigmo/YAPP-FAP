//
//  Person.m
//  31 ObjC
//
//  Created by Johan Wigmo on 2019-01-31.
//  Copyright © 2019 Newton. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName: (NSString *)name age: (int)age andNickname: (nullable NSString*)nickname
{
    self = [super init];
    if (self) {
        self.name = name;
        self.age = age;
        self.nickname = nickname;
    }
    return self;
}

@end
