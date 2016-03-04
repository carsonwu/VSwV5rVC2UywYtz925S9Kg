//
//  AftershipCreateTrackingRequest.h
//  Aftership-SDK-iOS
//
//  Created by 邦成 吴 on 2/3/2016.
//  Copyright © 2016 carson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AftershipBaseRequest.h"
#import "AftershipTracking.h"

@interface AftershipCreateTrackingRequest : AftershipBaseRequest

@property (nonatomic, strong) AftershipTracking *tracking;

+ (instancetype)requestWithTracking:(AftershipTracking *)tracking
                    completionBlock:(void (^)(AftershipCreateTrackingRequest *, id nullable, NSError *))completionBlock;

@end
