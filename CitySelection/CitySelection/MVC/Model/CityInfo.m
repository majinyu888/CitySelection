//
//  AddressJSONModel.m
//  CLW
//
//  Created by majinyu on 16/1/10.
//  Copyright © 2016年 cn.com.cucsi. All rights reserved.
//

#import "CityInfo.h"

@implementation CityInfo

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (!self) {
        self = [[CityInfo alloc] init];
    }
    
    self.city_id   = dic[@"id"];
    self.city_name = dic[@"name"];
    self.city_code = dic[@"citycode"];
    self.city_pyf  = dic[@"pyf"];
    self.city_pys  = dic[@"pys"];
    
    self.city_AZ = nil;//默认是nil
    
    return self;
}

@end
