//
//  AftershipError.m
//  Aftership-SDK-iOS
//
//  Created by Carson Wu on 3/3/16.
//  Copyright © 2016 carson. All rights reserved.
//

#import "AftershipError.h"

#define Error_Domain @"com.aftership.ErrorDomain"

@implementation AftershipError

+ (instancetype)errorWithMeta:(AftershipMeta *)meta{
    NSString *errMsg = [NSString stringWithFormat:@"Code: %@, type: %@, message: %@", meta.code, meta.type, meta.message];
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey: errMsg};
    return [self errorWithDomain:Error_Domain code:meta.code.intValue userInfo:userInfo];
}

@end
