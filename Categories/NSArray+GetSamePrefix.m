//
//  NSArray+GetSamePrefix.m
//  Hello
//
//  Created by zhihuiguan on 13-6-8.
//  Copyright (c) 2013年 GGS. All rights reserved.
//

#import "NSArray+GetSamePrefix.h"

@implementation NSArray(GetSamePrefix)

- (NSString *)getSamePrefixString
{
    NSString * result = nil;
    if (self.count == 1) {
        NSArray * arr = [(NSString *)self[0] componentsSeparatedByString:@","];
        NSMutableArray * marr = [[NSMutableArray alloc] initWithArray:arr];
        [marr removeLastObject];
        result = [marr componentsJoinedByString:@","];
        return result;
    }
    
    __block NSUInteger minLevel = 10000;
    NSMutableArray * marray = [[NSMutableArray alloc] initWithCapacity:16];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSArray * arr = [(NSString *)obj componentsSeparatedByString:@","];
        [marray addObject:arr];
        if (minLevel > arr.count) minLevel = arr.count;
    }];
    
    [marray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSArray * a1 = (NSArray *)obj1;
        NSArray * a2 = (NSArray *)obj2;
        return a1.count > a2.count;
    }];
    
    
    // 最终有效的下标数
    __block int resultIndex = -1;
    __block BOOL needBreak = NO;
    for (int i = 0; i < minLevel; i ++) {
        resultIndex = i;
        __block NSString * comp = nil;
        
        [marray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSArray * subArr = (NSArray *)obj;
            if (comp == nil) {
                comp = subArr[i];
            }
            else if(![comp isEqualToString:subArr[i]])
            {
                needBreak = YES;
                *stop = YES;
            }
            
        }];
        
        if (needBreak) break;
    }
    
    if (resultIndex > -1) {
        NSArray * firstRow = marray[0];
        NSArray * subArr = [firstRow subarrayWithRange:NSMakeRange(0, needBreak ? resultIndex : resultIndex + 1)];
        result = [subArr componentsJoinedByString:@","];
    }
    
    NSLog(@"--> result:%@",result);
    return result;
}
@end
