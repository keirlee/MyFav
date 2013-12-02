//
//  UIColor+Addition.h
//  ChildrenDemo
//
//  Created by zhihuiguan on 13-1-31.
//  Copyright (c) 2013年 zhihuiguan. All rights reserved.
//

#import <UIKit/UIKit.h>
#define DEFAULT_VOID_COLOR [UIColor whiteColor]

@interface UIColor (Addition)
//将css颜色转换成ios类型的颜色
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
@end
