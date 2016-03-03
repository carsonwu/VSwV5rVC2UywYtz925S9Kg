//
//  AftershipCreateTrackingRequest.m
//  Aftership-SDK-iOS
//
//  Created by 邦成 吴 on 2/3/2016.
//  Copyright © 2016 carson. All rights reserved.
//

#import "AftershipCreateTrackingRequest.h"

@implementation AftershipCreateTrackingRequest

- (instancetype)initWithTracking:(AftershipTracking *)tracking
                 completionBlock:(void (^)(AftershipCreateTrackingRequest *, AftershipTracking *, NSError *))completionBlock {
    self = [super init];
    if (self) {
        self.httpMtehod = API_HTTP_METHOD_POST;
        self.path = @"trackings";
        self.completionHandler = completionBlock;
        self.tracking = tracking;
    }
    
    return self;
}

+ (instancetype)requestWithTracking:(AftershipTracking *)tracking
                    completionBlock:(void (^)(AftershipCreateTrackingRequest *, AftershipTracking *, NSError *))completionBlock {
    return [[self alloc] initWithTracking:tracking
                          completionBlock:completionBlock];
}

- (NSDictionary*)paramDict{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];

    //TODO: get param dict for create tracking api call
    return params;
}

@end
