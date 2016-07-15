//
//  CitySelectionListVC.m
//  CitySelection
//
//  Created by majinyu on 16/3/22.
//  Copyright © 2016年 com.majinyu. All rights reserved.
//

#import "CitySelectionListVC.h"
#import "JYUtils.h"
#import "CityGroupInfo.h"
#import "CityInfo.h"

@interface CitySelectionListVC ()<
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *maCitys;
@end

@implementation CitySelectionListVC

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initDataAndUI];
}

#pragma mark - Custom Function

/**
 *  数据和UI
 */
- (void) initDataAndUI
{
    WS(ws);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(dismissAction)];
    _maCitys = [JYUtils citys];
    
    _tableView = [[UITableView alloc] init];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(ws.view).with.offset(0);
    }];
    
}

/**
 *  隐藏
 */
- (void) dismissAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -  TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  _maCitys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CityGroupInfo *info = _maCitys[section];
    return info.cities.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    CityGroupInfo *groupInfo = _maCitys[indexPath.section];
    CityInfo *info = groupInfo.cities[indexPath.row];
    
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.textLabel.text = info.city_name;
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CityGroupInfo *groupInfo = _maCitys[section];
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    lbl.backgroundColor = [UIColor groupTableViewBackgroundColor];
    lbl.font = [UIFont systemFontOfSize:11];
    lbl.text = [NSString stringWithFormat:@"  %@",groupInfo.AZ];
    return lbl;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CityGroupInfo *groupInfo = _maCitys[indexPath.section];
    CityInfo *info = groupInfo.cities[indexPath.row];
    [self dismissViewControllerAnimated:YES completion:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateUserSelectCity" object:info];
    }];
}

@end
