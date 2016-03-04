//
//  AftershipApiManager.m
//  Aftership-SDK-iOS
//
//  Created by 邦成 吴 on 1/3/2016.
//  Copyright © 2016 carson. All rights reserved.
//

#import "AftershipApiManager.h"
#import <AFNetworking/AFNetworking.h>

//#define API_KEY       @"4d396a35-bcd8-4186-befb-460f877a7c5a"
#define BASE_URL      @"https://api.aftership.com"
#define API_VERSION   @"4"

@implementation AftershipApiManager{
    // Use 'AFJSONRequestSerializer' to perform JSON-encoded parameters request
    AFJSONRequestSerializer *JSONRequestSerializer;
}

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
        [JSONRequestSerializer setValue:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
                     forHTTPHeaderField:@"aftership-user-agent"];
    }
    return self;
}

+ (instancetype)managerWithApiKey:(NSString *)apiKey {
    return [[self alloc] initWithApiKey:apiKey];
}

- (NSError*)parseMetaForError:(NSDictionary *)metaDict{
    NSError *err = nil;
    AftershipMeta *meta = [[AftershipMeta alloc] initWithDict:metaDict];
    int responseCode = meta.code.intValue;
    if (responseCode >= 200 && responseCode < 300) {
        //successful response
    }else{
        err = [AftershipError errorWithMeta:meta];
    }
    return err;
}

- (void)performRequest:(AftershipBaseRequest *)request{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = JSONRequestSerializer;
    AFSecurityPolicy* policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    [policy setValidatesDomainName:NO];
    [policy setAllowInvalidCertificates:YES];

    manager.securityPolicy = policy;
    
    //Accept only JSON response, if non-JSON is returned, an error will occur during validation
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
    
    NSString *fullUrl = [NSString stringWithFormat:@"%@%@", self.baseUrl, request.path];
    
    /*Declare common successful block:
     By default handling, AFNetworking uses 'NSJSONSerialization' with 'NSJSONReadingMutableContainers' option to serialize response data and that generates mutable NSArrays and NSDictionaries.
     */
    void (^successfulBlock)(NSURLSessionDataTask * _Nonnull task, id _Nullable result) = ^(NSURLSessionDataTask * task, id resultData){
        
        NSError *error = [self parseMetaForError:resultData[@"meta"]];
        
        //Rate limit handling: retrive rate limit info from response header and add to 'dataDictionary' for user reference
        NSHTTPURLResponse *response = (NSHTTPURLResponse*) task.response;
        NSDictionary *headerDict = response.allHeaderFields;
        NSDictionary *rateLimitDict = @{@"X-RateLimit-Reset":headerDict[@"X-RateLimit-Reset"],
                                        @"X-RateLimit-Limit":headerDict[@"X-RateLimit-Limit"],
                                        @"X-RateLimit-Remaining":headerDict[@"X-RateLimit-Remaining"],};

        NSMutableDictionary *dataDictionary = [NSMutableDictionary dictionaryWithDictionary:resultData[@"data"]];
        [dataDictionary setObject:rateLimitDict forKey:@"rate_limit_info"];
        
        if (request.completionHandler) {
            request.completionHandler(request, dataDictionary, error);
        }
    };
    
    //Declare common failure block
    void (^failureBlock)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) = ^(NSURLSessionDataTask * task, NSError * error){
        if (request.completionHandler) {
            request.completionHandler(request, nil, error);
        }
    };
    
    switch (request.httpMtehod) {
        case API_HTTP_METHOD_GET:
        {
            [manager GET:fullUrl
              parameters:request.paramDict
                progress:nil
                 success:successfulBlock
                 failure:failureBlock];
        }
            break;
        case API_HTTP_METHOD_POST:
        {
            [manager POST:fullUrl
               parameters:request.paramDict
                 progress:nil
                  success:successfulBlock
                  failure:failureBlock];
        }
            break;
        case API_HTTP_METHOD_DELETE:
        {
            [manager DELETE:fullUrl
                 parameters:request.paramDict
                    success:successfulBlock
                    failure:failureBlock];
        }
            break;
        case API_HTTP_METHOD_PUT:
        {
            [manager PUT:fullUrl
              parameters:request.paramDict
                 success:successfulBlock
                 failure:failureBlock];
        }
            break;
        default:
            break;
    }
}


@end
