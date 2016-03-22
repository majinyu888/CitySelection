//
//  BaseVC.m
//  CALayerDemo
//
//  Created by typc on 16/2/22.
//  Copyright © 2016年 com.typc. All rights reserved.
//

#import "BaseVC.h"

@interface BaseVC ()

@end

@implementation BaseVC

#pragma mark - Life Cycle

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;

}


@end
