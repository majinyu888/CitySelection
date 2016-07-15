//
//  HomeVC.m
//  CALayerDemo
//
//  Created by typc on 16/2/22.
//  Copyright © 2016年 com.typc. All rights reserved.
//

#import "HomeVC.h"
#import "CitySelectionVC.h"//

@interface HomeVC ()<
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray     *arrList;


@end

@implementation HomeVC

#pragma mark - Life Cycle

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initDataAndUI];
}

#pragma mark - Data & UI
/**
 *  数据 和  UI
 */
-(void)initDataAndUI
{
    self.title = @"Demo";
    self.arrList = @[
                     NSStringFromClass([CitySelectionVC class])
                     ];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    WS(ws);
    UIEdgeInsets padding = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.equalTo(ws.view).with.insets(padding);
    }];
}

#pragma mark - TableView DataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = _arrList[indexPath.row];
    return cell;
}
#pragma mark - TableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class class = NSClassFromString(_arrList[indexPath.row]);
    [self.navigationController pushViewController:[[class alloc] init] animated:YES];
}




@end
