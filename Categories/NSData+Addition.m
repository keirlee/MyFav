//
//  NSData+Addition.m
//  BytalkApp
//
//  Created by zhihuiguan on 13-3-27.
//  Copyright (c) 2013年 zhihuiguan. All rights reserved.
//

#import "NSData+Addition.h"

@implementation NSData (Addition)
- (NSString *)stringToDeviceToken{
    NSMutableString *_temp = [[NSMutableString alloc] init];
    NSUInteger start = 1;
    NSUInteger during = 8;
    NSUInteger time = 0;
    for (int i = start; time < 8; i += 9) {
        NSRange range = NSMakeRange(i, during);
        NSString *str = [[self description] substringWithRange:range];
        [_temp appendString:str];
        time++;
    }
    return _temp;
}
@end
