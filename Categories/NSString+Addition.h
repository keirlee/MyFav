//
//  NSString+Addition.h
//  BytalkApp
//
//  Created by zhihuiguan on 13-2-25.
//  Copyright (c) 2013年 zhihuiguan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Addition)
//得到当前时间
+ (NSString *) getCurrentTime;
//符号编码
- (NSString *) substituteEmoticons;

- (NSString *)prp_URLEncodedFormStringUsingEncoding:(NSStringEncoding)encoding;

- (NSString *)prp_percentEscapedStringWithEncoding:(NSStringEncoding)encoding additionalCharacters:(NSString *)add ignoredCharacters:(NSString *)ignoredCharacters;
- (NSString *)stringCleanedForXML;
@end
