//
//  AddressGroupJSONModel.h
//  CLW
//
//  Created by majinyu on 16/1/10.
//  Copyright © 2016年 cn.com.cucsi. All rights reserved.
//

@class CityModel;

#import <Foundation/Foundation.h>

@interface CityGroupInfo : NSObject

@property (nonatomic, copy)   NSString *AZ;
@property (nonatomic, strong) NSMutableArray<CityModel *> *cities;

- (instancetype) initWithDic:(NSDictionary *)dic;

@end
