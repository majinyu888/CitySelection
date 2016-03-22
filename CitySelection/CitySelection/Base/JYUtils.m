//
//  Utils.m
//  CitySelection
//
//  Created by majinyu on 16/3/22.
//  Copyright © 2016年 com.majinyu. All rights reserved.
//

#import "JYUtils.h"
#import "JYJSON.h"
#import "CityGroupInfo.h"
#import "CityInfo.h"

@implementation JYUtils

+ (NSMutableArray *)citys
{
    NSString *cityPath = [[NSBundle mainBundle] pathForResource:@"CityList.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:cityPath options:NSDataReadingUncached error:nil];
    NSDictionary *dicCitys = [JYJSON dictionaryOrArrayWithJSONSData:data];
    NSArray *arrCitys = dicCitys[@"citylist"];
    
    NSMutableArray *ma = [NSMutableArray array];
    for (NSDictionary *dic in arrCitys) {
        CityGroupInfo *jsonInfo = [[CityGroupInfo alloc] initWithDic:dic];
        [ma addObject:jsonInfo];
    }
    return ma;
}


@end
