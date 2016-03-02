//
//  AftershipTracking.h
//  Aftership-SDK-iOS
//
//  Created by 邦成 吴 on 2/3/2016.
//  Copyright © 2016 carson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AftershipTracking : NSObject

@property (nonatomic, strong) NSString* createTime;
@property (nonatomic, strong) NSString* updateTime;
@property (nonatomic, strong) NSString* identifier;
@property (nonatomic, strong) NSString* trackingNumber;
@property (nonatomic, strong) NSString* trackingPostalCode;
@property (nonatomic, strong) NSString* trackingShipDate;
@property (nonatomic, strong) NSString* trackingAccountNumber;
@property (nonatomic, strong) NSString* trackingDestinationCountry;
@property (nonatomic, strong) NSString* trackingKey;
@property (nonatomic, strong) NSString* slug;
@property (nonatomic, strong) NSNumber * isActive;
@property (nonatomic, strong) NSDictionary* customFields;
@property (nonatomic, strong) NSString* customName;
@property (nonatomic, strong) NSNumber* deliveryTime;
@property (nonatomic, strong) NSString* destionationCountryCode;
@property (nonatomic, strong) NSArray* emails;
@property (nonatomic, strong) NSString* expectedDeliveryDate;
@property (nonatomic, strong) NSString* orderId;
@property (nonatomic, strong) NSString* orderIdPath;
@property (nonatomic, strong) NSString* originCountryCode;
@property (nonatomic, strong) NSString* uniqueToken;
@property (nonatomic, strong) NSNumber* shipmentPackageCount;
@property (nonatomic, strong) NSString* shipmentType;
@property (nonatomic, strong) NSNumber* shipmentWeight;
@property (nonatomic, strong) NSString* shipmentWeightUnit;
@property (nonatomic, strong) NSString* signedBy;
@property (nonatomic, strong) NSArray* smses;
@property (nonatomic, strong) NSString* source;
@property (nonatomic, strong) NSString* tag;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSNumber* trackedCount;
@property (nonatomic, strong) NSArray* checkpoints;
@property (nonatomic, strong) NSArray* android;
@property (nonatomic, strong) NSArray* ios;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

- (NSDictionary *)getParamDict;

@end
