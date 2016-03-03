//
//  AftershipTracking.m
//  Aftership-SDK-iOS
//
//  Created by 邦成 吴 on 2/3/2016.
//  Copyright © 2016 carson. All rights reserved.
//

#import "AftershipTracking.h"

@implementation AftershipTracking

- (instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        //non 'id' property
        self.createTime = [dict[@"created_at"] isKindOfClass:[NSNull class]]? nil:dict[@"created_at"];
        self.updateTime = [dict[@"updated_at"] isKindOfClass:[NSNull class]]? nil:dict[@"updated_at"];
        self.identifier = [dict[@"id"] isKindOfClass:[NSNull class]]? nil:dict[@"id"];
        self.trackingPostalCode = [dict[@"tracking_postal_code"] isKindOfClass:[NSNull class]]? nil:dict[@"tracking_postal_code"];
        self.trackingShipDate = [dict[@"tracking_ship_date"] isKindOfClass:[NSNull class]]? nil:dict[@"tracking_ship_date"];
        self.trackingAccountNumber = [dict[@"tracking_account_number"] isKindOfClass:[NSNull class]]? nil:dict[@"tracking_account_number"];
        self.trackingKey = [dict[@"tracking_key"] isKindOfClass:[NSNull class]]? nil:dict[@"tracking_key"];
        self.trackingDestinationCountry = [dict[@"tracking_destination_country"] isKindOfClass:[NSNull class]]? nil:dict[@"tracking_destination_country"];
        self.isActive = [dict[@"active"] isKindOfClass:[NSNull class]]? nil:dict[@"active"];
        self.customFields = [dict[@"custom_fields"] isKindOfClass:[NSNull class]]? nil:dict[@"custom_fields"];
        self.customName = [dict[@"customer_name"] isKindOfClass:[NSNull class]]? nil:dict[@"customer_name"];
        self.deliveryTime = [dict[@"delivery_time"] isKindOfClass:[NSNull class]]? nil:dict[@"delivery_time"];
        self.destinationCountryIso3 = [dict[@"destination_country_iso3"] isKindOfClass:[NSNull class]]? nil:dict[@"destination_country_iso3"];
        self.expectedDeliveryDate = [dict[@"expected_delivery"] isKindOfClass:[NSNull class]]? nil:dict[@"expected_delivery"];
        self.orderId = [dict[@"order_id"] isKindOfClass:[NSNull class]]? nil:dict[@"order_id"];
        self.orderIdPath = [dict[@"order_id_path"] isKindOfClass:[NSNull class]]? nil:dict[@"order_id_path"];
        self.originCountryCode = [dict[@"origin_country_iso3"] isKindOfClass:[NSNull class]]? nil:dict[@"origin_country_iso3"];
        self.uniqueToken = [dict[@"unique_token"] isKindOfClass:[NSNull class]]? nil:dict[@"unique_token"];
        self.shipmentPackageCount = [dict[@"shipment_package_count"] isKindOfClass:[NSNull class]]? nil:dict[@"shipment_package_count"];
        self.shipmentType = [dict[@"shipment_type"] isKindOfClass:[NSNull class]]? nil:dict[@"shipment_type"];
        self.shipmentWeight = [dict[@"shipment_weight"] isKindOfClass:[NSNull class]]? nil:dict[@"shipment_weight"];
        self.shipmentWeightUnit = [dict[@"shipment_weight_unit"] isKindOfClass:[NSNull class]]? nil:dict[@"shipment_weight_unit"];
        self.signedBy = [dict[@"signed_by"] isKindOfClass:[NSNull class]]? nil:dict[@"signed_by"];
        self.source = [dict[@"source"] isKindOfClass:[NSNull class]]? nil:dict[@"source"];
        self.tag = [dict[@"tag"] isKindOfClass:[NSNull class]]? nil:dict[@"tag"];
        self.title = [dict[@"title"] isKindOfClass:[NSNull class]]? nil:dict[@"title"];
        self.trackedCount = [dict[@"tracked_count"] isKindOfClass:[NSNull class]]? nil:dict[@"tracked_count"];
        
        
        //'id' property
        self.slug = [dict[@"slug"] isKindOfClass:[NSNull class]]? nil:dict[@"slug"];
        self.android = [dict[@"android"] isKindOfClass:[NSNull class]]? nil:dict[@"android"];
        self.emails = [dict[@"emails"] isKindOfClass:[NSNull class]]? nil:dict[@"emails"];
        self.ios = [dict[@"ios"] isKindOfClass:[NSNull class]]? nil:dict[@"ios"];
        self.smses = [dict[@"smses"] isKindOfClass:[NSNull class]]? nil:dict[@"smses"];
        
    }
    return self;
}

- (NSDictionary *)getParamDict{
    //use setValue:forKey instead in order to handle 'nil' property case
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:self.trackingNumber forKey:@"tracking_number"];
    [dic setValue:self.slug forKey:@"slug"];
    [dic setValue:self.trackingPostalCode forKey:@"tracking_postal_code"];
    [dic setValue:self.trackingShipDate forKey:@"tracking_ship_date"];
    [dic setValue:self.trackingAccountNumber forKey:@"tracking_account_number"];
    [dic setValue:self.trackingKey forKey:@"tracking_key"];
    [dic setValue:self.trackingDestinationCountry forKey:@"tracking_destination_country"];
    [dic setValue:self.android forKey:@"android"];
    [dic setValue:self.ios forKey:@"ios"];
    [dic setValue:self.emails forKey:@"emails"];
    [dic setValue:self.smses forKey:@"smses"];
    [dic setValue:self.title forKey:@"title"];
    [dic setValue:self.customName forKey:@"customer_name"];
    [dic setValue:self.destinationCountryIso3 forKey:@"destination_country_iso3"];
    [dic setValue:self.orderId forKey:@"order_id"];
    [dic setValue:self.orderIdPath forKey:@"order_id_path"];
    [dic setValue:self.customFields forKey:@"custom_fields"];
    return dic;
}

@end
