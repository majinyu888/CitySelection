//
//  CitySelectionView.h
//  CitySelection
//
//  Created by typc on 16/3/23.
//  Copyright © 2016年 com.majinyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CityInfo;
@class CityGroupInfo;

@interface CitySelectionView : UIView

/**
 *  点击某个城市的回调
 */
@property (nonatomic, copy) void(^onSeletedCityClick)(CityInfo *city, NSInteger index);

/**
 *  点击选择城市的回调
 */
@property (nonatomic, copy) void(^onChangeCityClick)();

/**
 *  当前城市
 */
@property (nonatomic, strong) CityInfo *currentCity ;

/**
 *  当前城市组(这里本应该是对应本市下面的各个区的列表信息,但是数据没有暂时改)
 */
@property (nonatomic, strong) CityGroupInfo *currentCityGroup ;



@end
