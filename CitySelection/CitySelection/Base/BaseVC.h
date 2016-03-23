//
//  BaseVC.h
//  CALayerDemo
//
//  Created by typc on 16/2/22.
//  Copyright © 2016年 com.typc. All rights reserved.
//

#define SCREEN_WIDTH      [UIScreen mainScreen].bounds.size.width //屏幕宽度
#define SCREEN_HEIGHT     [UIScreen mainScreen].bounds.size.height//屏幕高度
#define APPDELEGATE       (AppDelegate *)[UIApplication sharedApplication].delegate//应用单例
#define NAV_BAR_HEIGHT    self.navigationController.navigationBar.frame.size.height
#define STATUS_BAR_HEIGHT 20.f

#define RADIANS_TO_DEGREES(x) ((x)/M_PI*180.0)//弧度转换
#define DEGREES_TO_RADIANS(x) ((x)/180.0*M_PI)//弧度转换

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Masonry.h"
#import "JYUtils.h"

@interface BaseVC : UIViewController


@end
