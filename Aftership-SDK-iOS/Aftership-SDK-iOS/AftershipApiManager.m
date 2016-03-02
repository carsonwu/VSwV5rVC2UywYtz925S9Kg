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
        JSONRequestSerializer = [AFJSONRequestSerializer serializer];
        
        //set up default request header. Including: api key, content type and SDK version.
        [JSONRequestSerializer setValue:self.apiKey
                     forHTTPHeaderField:@"aftership-api-key"];
        [JSONRequestSerializer setValue:@"application/json"
                     forHTTPHeaderField:@"Content-Type"];
        [JSONRequestSerializer setValue:[NSString stringWithFormat:@"aftership-ios-sdk %@",
                                         [[[NSBundle mainBundle] infoDictionary]
                                          objectForKey:@"CFBundleShortVersionString"]]
                     forHTTPHeaderField:@"aftership-user-agent"];
    }
    return self;
}

+ (instancetype)managerWithApiKey:(NSString *)apiKey {
    return [[self alloc] initWithApiKey:apiKey];
}

@end
