//
//  CitySelectionVC.m
//  CitySelection
//
//  Created by typc on 16/3/22.
//  Copyright © 2016年 com.majinyu. All rights reserved.
//
#import <MapKit/MapKit.h>
#import "CitySelectionVC.h"
#import "CitySelectionListVC.h"
#import "CityInfo.h"
#import "CityGroupInfo.h"
#import "CitySelectionView.h"

@interface CitySelectionVC ()<
CLLocationManagerDelegate
>

/**
 *  定位对象
 */
@property (nonatomic, strong) CLLocationManager *locationManager;
/**
 *  坐标
 */
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

/**
 *  用户当前城市,默认为哈尔滨
 */
@property (nonatomic, strong) CityInfo *currentCity;

/**
 *  用户当前城市组,默认为哈尔滨组
 */
@property (nonatomic, strong) CityGroupInfo *currentCityGroup;

/**
 *  弹出的View
 */
@property (nonatomic, strong) CitySelectionView *citySeletctionView;



@end

@implementation CitySelectionVC


#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initDataAndUI];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Custom Function
/**
 *  数据和UI
 */
- (void) initDataAndUI
{
    self.title = @"城市选择";
    [self rightItem];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateUserSelectCity:)
                                                 name:@"updateUserSelectCity"
                                               object:nil];
}

- (void)updateUserSelectCity:(NSNotification *)noti
{
    CityInfo *city = noti.object;
    self.title = city.city_name;
    self.currentCity = city;
    self.citySeletctionView.currentCity = city;
    [self rightItem];
    
    NSLog(@"在这里做其他更新页面的事情");
}

- (void)rightItem
{
    UIBarButtonItem *cityItem = [[UIBarButtonItem alloc] initWithTitle:self.currentCity ? self.currentCity.city_name : @"选择城市"
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(rightItemClick)];
    self.navigationItem.rightBarButtonItem = cityItem;
}

/**
 *  设置默认的城市
 *
 *  @return
 */
- (CityInfo *)currentCity
{
    if (!_currentCity) {
        NSMutableArray *ma = [JYUtils citys];
        for (CityGroupInfo *citys in ma) {
            for (CityInfo *city in citys.cities) {
                if ([city.city_name isEqualToString:@"哈尔滨市"]) {
                    _currentCity = city;
                }
            }
        }
    }
    
    return _currentCity;
}

/**
 *  设置默认的城市组
 *
 *  @return
 */
- (CityGroupInfo *)currentCityGroup
{
    if (!_currentCityGroup) {
        _currentCityGroup = [JYUtils citys][arc4random() % [JYUtils citys].count];
    }
    return _currentCityGroup;
}

/**
 *  设置弹出的View
 *
 *  @return
 */
- (CitySelectionView *)citySeletctionView
{
    if (!_citySeletctionView) {
        _citySeletctionView = [[[NSBundle mainBundle] loadNibNamed:@"CitySelectionView" owner:nil options:nil] lastObject];
        
        __weak typeof (self) weakSelf = self;
        
        _citySeletctionView.currentCity = self.currentCity;
        _citySeletctionView.currentCityGroup = self.currentCityGroup;
        
        _citySeletctionView.onChangeCityClick = ^{
            CitySelectionListVC * vc = [[CitySelectionListVC alloc] init];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
            [weakSelf presentViewController:nav animated:YES completion:nil];
        };
        
        _citySeletctionView.onSeletedCityClick = ^(CityInfo *city, NSInteger index){
            if (index == 0) {
                weakSelf.title = @"默认城市";
            } else {
                weakSelf.title = city.city_name;
                weakSelf.currentCity = city;
                weakSelf.citySeletctionView.currentCity = city;
                [weakSelf rightItem];
            }
        };
    }
    
    return _citySeletctionView;
}

/**
 *  弹出城市选择
 */
- (void)rightItemClick
{
    [self.view addSubview:self.citySeletctionView];
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.citySeletctionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self.view);
            make.height.equalTo(@300);
        }];
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.citySeletctionView removeFromSuperview];
}



@end
