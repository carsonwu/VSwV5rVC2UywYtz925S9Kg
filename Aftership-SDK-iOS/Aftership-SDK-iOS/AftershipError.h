//
//  AftershipError.h
//  Aftership-SDK-iOS
//
//  Created by Carson Wu on 3/3/16.
//  Copyright © 2016 carson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AftershipMeta.h"

@interface AftershipError : NSError

+ (instancetype)errorWithMeta:(AftershipMeta *)meta;

@end
