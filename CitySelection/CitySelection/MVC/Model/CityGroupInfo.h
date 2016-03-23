//
//  AddressGroupJSONModel.h
//  CLW
//
//  Created by majinyu on 16/1/10.
//  Copyright © 2016年 cn.com.cucsi. All rights reserved.
//

@class CityInfo;

#import <Foundation/Foundation.h>

@interface CityGroupInfo : NSObject

@property (nonatomic, copy)   NSString *AZ;
@property (nonatomic, strong) NSMutableArray<CityInfo *> *cities;

- (instancetype) initWithDic:(NSDictionary *)dic;

@end
