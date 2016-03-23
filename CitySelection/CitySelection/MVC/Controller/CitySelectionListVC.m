//
//  CitySelectionListVC.m
//  CitySelection
//
//  Created by majinyu on 16/3/22.
//  Copyright © 2016年 com.majinyu. All rights reserved.
//

#import "CitySelectionListVC.h"

@interface CitySelectionListVC ()

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
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(dismissAction)];
}

/**
 *  隐藏
 */
- (void) dismissAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
