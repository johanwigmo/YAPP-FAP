//
//  Person.h
//  31 ObjC
//
//  Created by Johan Wigmo on 2019-01-31.
//  Copyright © 2019 Newton. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (strong) NSString *name;
@property (assign) int age;
@property (strong, nullable) NSString *nickname;

- (instancetype)initWithName: (NSString *)name age: (int)age andNickname: (nullable NSString*)nickname;

@end

NS_ASSUME_NONNULL_END
