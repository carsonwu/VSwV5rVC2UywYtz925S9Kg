//
//  AftershipMeta.m
//  Aftership-SDK-iOS
//
//  Created by Carson Wu on 3/3/16.
//  Copyright © 2016 carson. All rights reserved.
//

#import "AftershipMeta.h"

@implementation AftershipMeta

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.code       = [dict[@"code"] isKindOfClass:[NSNull class]]? nil:dict[@"code"];
        self.message    = [dict[@"message"] isKindOfClass:[NSNull class]]? nil:dict[@"message"];
        self.type       = [dict[@"type"] isKindOfClass:[NSNull class]]? nil:dict[@"type"];
    }
    return self;
}

@end
