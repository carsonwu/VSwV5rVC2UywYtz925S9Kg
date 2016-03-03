//
//  AftershipMeta.h
//  Aftership-SDK-iOS
//
//  Created by Carson Wu on 3/3/16.
//  Copyright © 2016 carson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AftershipMeta : NSObject

@property (nonatomic, strong) NSNumber *code;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *type;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
