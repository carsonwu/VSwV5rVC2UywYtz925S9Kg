//
//  AftershipGetTrackingRequest.m
//  Aftership-SDK-iOS
//
//  Created by 邦成 吴 on 2/3/2016.
//  Copyright © 2016 carson. All rights reserved.
//

#import "AftershipGetTrackingRequest.h"

@implementation AftershipGetTrackingRequest

- (instancetype)initWithTrackingNumber:(NSString *)trackingNumber
                                  slug:(NSString *)slug
                       completionBlock:(void (^)(AftershipGetTrackingRequest *, AftershipTracking *, NSError *))completionBlock {
    self = [super init];
    if (self) {
        self.trackingNumber = trackingNumber;
        self.slug = slug;
        self.completionHandler = completionBlock;
        [self setupCommonProperty];
    }
    
    return self;
}

+ (instancetype)requestWithTrackingNumber:(NSString *)trackingNumber
                                     slug:(NSString *)slug
                          completionBlock:(void (^)(AftershipGetTrackingRequest *, AftershipTracking *, NSError *))completionBlock {
    return [[self alloc] initWithTrackingNumber:trackingNumber slug:slug
                                completionBlock:completionBlock];
}

- (instancetype)initWithIdentifier:(NSString *)identifier
                   completionBlock:(void (^)(AftershipGetTrackingRequest *, AftershipTracking *, NSError *))completionBlock {
    self = [super init];
    if (self) {
        self.identifier = identifier;
        self.completionHandler = completionBlock;
        [self setupCommonProperty];
    }
    
    return self;
}

+ (instancetype)requestWithIdentifier:(NSString *)identifier
                      completionBlock:(void (^)(AftershipGetTrackingRequest *, AftershipTracking *, NSError *))completionBlock {
    return [[self alloc] initWithIdentifier:identifier
                            completionBlock:completionBlock];
}

- (void)setupCommonProperty{
    self.httpMtehod = API_HTTP_METHOD_GET;
    if (self.identifier && [self.identifier length]>0) {
        self.path = [NSString stringWithFormat:@"trackings/%@", self.identifier];
    }else{
        self.path = [NSString stringWithFormat:@"trackings/%@/%@", self.slug, self.trackingNumber];
    }
}

- (NSDictionary*)paramDict{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (self.lang && [self.lang length]>0) {
        [params setObject:self.lang forKey:@"lang"];
    }
    if (self.fields && [self.fields length]>0) {
        [params setObject:self.fields forKey:@"fields"];
    }
    return params;
}

@end
