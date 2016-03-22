//
//  AddressGroupJSONModel.m
//  CLW
//
//  Created by majinyu on 16/1/10.
//  Copyright © 2016年 cn.com.cucsi. All rights reserved.
//

#import "CityGroupInfo.h"
#import "CityInfo.h"

@implementation CityGroupInfo

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (!self) {
        self = [[CityGroupInfo alloc] init];
    }
    
    self.AZ = dic[@"AZ"];
    NSArray *arrCitys = dic[@"cities"];
    NSMutableArray *ma = [NSMutableArray array];
    for (NSDictionary *dic in arrCitys) {
        CityInfo *city = [[CityInfo alloc] initWithDic:dic];
        city.city_AZ = self.AZ;
        [ma addObject:city];
    }
    self.cities = ma;
    
    return self;
    
}

@end
