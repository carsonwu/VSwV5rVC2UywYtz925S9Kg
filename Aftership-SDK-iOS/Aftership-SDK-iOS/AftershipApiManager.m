//
//  AftershipApiManager.m
//  Aftership-SDK-iOS
//
//  Created by 邦成 吴 on 1/3/2016.
//  Copyright © 2016 carson. All rights reserved.
//

#import "AftershipApiManager.h"

//#define API_KEY       @"4d396a35-bcd8-4186-befb-460f877a7c5a"
#define BASE_URL      @"https://api.aftership.com"
#define API_VERSION   @"4"

@implementation AftershipApiManager

- (instancetype)initWithApiKey:(NSString *)apiKey {
    if (self == [super init]) {
        self.apiKey = apiKey;
        self.baseUrl = [NSString stringWithFormat:@"%@/v%@/", BASE_URL, API_VERSION];
    }
    return self;
}

+ (instancetype)clientWithApiKey:(NSString *)apiKey {
    return [[self alloc] initWithApiKey:apiKey];
}

- (instancetype)initWithApiKey:(NSString *)apiKey baseUrl:(NSString *)baseUrl {
    if (self == [super init]) {
        self.apiKey = apiKey;
        self.baseUrl = baseUrl;
    }
    return self;
}

@end
