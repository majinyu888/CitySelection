//
//  AddressJSONModel.h
//  CLW
//
//  Created by majinyu on 16/1/10.
//  Copyright © 2016年 cn.com.cucsi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityInfo : NSObject

@property (nonatomic ,copy) NSString *city_id;
@property (nonatomic ,copy) NSString *city_code;
@property (nonatomic ,copy) NSString *city_name;
@property (nonatomic ,copy) NSString *city_pyf;
@property (nonatomic ,copy) NSString *city_pys;

@property (nonatomic ,copy) NSString *city_AZ;//分组的属性


- (instancetype)initWithDic:(NSDictionary *)dic;

@end
