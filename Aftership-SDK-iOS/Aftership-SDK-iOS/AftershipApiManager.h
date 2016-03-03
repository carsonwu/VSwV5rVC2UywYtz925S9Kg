//
//  AftershipApiManager.h
//  Aftership-SDK-iOS
//
//  Created by 邦成 吴 on 1/3/2016.
//  Copyright © 2016 carson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "AftershipBaseRequest.h"
#import "AftershipMeta.h"
#import "AftershipError.h"

@interface AftershipApiManager : NSObject{
    
    // Use 'AFJSONRequestSerializer' to perform JSON-encoded parameters request
    AFJSONRequestSerializer *JSONRequestSerializer;
}

@property (nonatomic, strong) NSString *apiKey;
@property (nonatomic, strong) NSString *baseUrl;

+ (instancetype)managerWithApiKey:(NSString *)apiKey;

/*A convenient api call method: you just need to init an request instance that you want to call and pass it into this method. The manager will handle all the rest for you.*/
- (void)performRequest:(AftershipBaseRequest *)request;

@end
