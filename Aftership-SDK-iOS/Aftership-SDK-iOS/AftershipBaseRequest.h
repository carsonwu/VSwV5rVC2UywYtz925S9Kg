//
//  AftershipBaseRequest.h
//  Aftership-SDK-iOS
//
//  Created by Carson Wu on 2/3/16.
//  Copyright © 2016 carson. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, API_HTTP_METHOD) {
    API_HTTP_METHOD_GET,
    API_HTTP_METHOD_POST,
    API_HTTP_METHOD_PUT,
    API_HTTP_METHOD_DELETE
};

@interface AftershipBaseRequest : NSObject

@property (nonatomic, assign) API_HTTP_METHOD   httpMtehod;
@property (nonatomic, strong) NSString         *path;
@property (nonatomic, strong) NSDictionary     *paramDict;

@property (nonatomic, copy) void (^completionHandler)(id request, id result, NSError *error);

@end
