//
//  AftershipGetTrackingRequest.h
//  Aftership-SDK-iOS
//
//  Created by 邦成 吴 on 2/3/2016.
//  Copyright © 2016 carson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AftershipBaseRequest.h"
#import "AftershipTracking.h"

@interface AftershipGetTrackingRequest : AftershipBaseRequest

//get-tracking request specific properties
@property (nonatomic, strong) NSString  *identifier;
@property (nonatomic, strong) NSString  *slug;
@property (nonatomic, strong) NSString  *trackingNumber;

//Optional parameters
@property (nonatomic, strong) NSString  *fields;
@property (nonatomic, strong) NSString  *lang;

+ (instancetype)requestWithTrackingNumber:(NSString *)trackingNumber
                                     slug:(NSString *)slug
                          completionBlock:(void (^)(AftershipGetTrackingRequest *, id nullable, NSError *))completionBlock;

+ (instancetype)requestWithIdentifier:(NSString *)identifier
                      completionBlock:(void (^)(AftershipGetTrackingRequest *, id nullable, NSError *))completionBlock;

@end
