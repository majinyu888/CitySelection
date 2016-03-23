//
//  CitySelectionView.m
//  CitySelection
//
//  Created by typc on 16/3/23.
//  Copyright © 2016年 com.majinyu. All rights reserved.
//

#import "CitySelectionView.h"
#import "CityInfo.h"
#import "CityGroupInfo.h"
#import "CityCollectionViewCell.h"

@interface CitySelectionView()<
UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout
> {
    
}
/**
 *  网格
 */
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

/**
 *  底部的View容器(添加单击手势使用)
 */
@property (weak, nonatomic) IBOutlet UIView           *viewChangeCity;

/**
 *  改变城市
 */
@property (weak, nonatomic) IBOutlet UIButton         *btnChangeCity;

/**
 *  当前城市 : XXX
 */
@property (weak, nonatomic) IBOutlet UILabel          *lblCurrentCity;

@end

@implementation CitySelectionView

- (void)awakeFromNib
{
    /**
     *  复用单元格
     */
    [self.collectionView registerNib:[UINib nibWithNibName:@"CityCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CityCollectionViewCell"];
    self.collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    /**
     * 给改变城市添加单击事件
     */
    [_btnChangeCity addTarget:self action:@selector(changeCityTap) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)changeCityTap
{
    if (self.onChangeCityClick) {
        self.onChangeCityClick();
    }
}


- (void)setCurrentCity:(CityInfo *)currentCity
{
    _currentCity = currentCity;
    _lblCurrentCity.text = [NSString stringWithFormat:@"当前城市: %@",currentCity.city_name];
}

- (void)setCurrentCityGroup:(CityGroupInfo *)currentCityGroup
{
    _currentCityGroup = currentCityGroup;
    [self.collectionView reloadData];
}

#pragma mark - CollectionView DataSource

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (_currentCityGroup) {
        return _currentCityGroup.cities.count + 1;
    } else {
        return 1;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CityCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CityCollectionViewCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CityCollectionViewCell" owner:nil options:nil] lastObject];
    }
    if (indexPath.row == 0) {
        cell.lblCity.text = @"默认城市";
    } else {
        CityInfo *cityInfo = _currentCityGroup.cities[indexPath.row - 1];
        cell.lblCity.text = cityInfo.city_name;
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width;
    CGFloat height;
    width = (CGRectGetWidth([UIScreen mainScreen].bounds) - 60) * 1.0 / 3;
    height = 38;
    return CGSizeMake(width, height);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.onSeletedCityClick) {
        if (indexPath.row == 0) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"您点击了默认城市"
                                                            message:nil
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil,
                                  nil];
            [alert show];
        } else {
            CityInfo *cityInfo = _currentCityGroup.cities[indexPath.row - 1];
            self.onSeletedCityClick(cityInfo, indexPath.row);
        }
    }
}




@end
