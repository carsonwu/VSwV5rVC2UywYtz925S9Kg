//
//  AftershipApiManager.h
//  Aftership-SDK-iOS
//
//  Created by 邦成 吴 on 1/3/2016.
//  Copyright © 2016 carson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface AftershipApiManager : NSObject{
    
    // Use 'AFJSONRequestSerializer' to perform JSON-encoded parameters request
    AFJSONRequestSerializer *JSONRequestSerializer;
}

@property (nonatomic, strong) NSString *apiKey;
@property (nonatomic, strong) NSString *baseUrl;

+ (instancetype)managerWithApiKey:(NSString *)apiKey;

@end
