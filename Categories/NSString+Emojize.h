//
//  NSString+Emojize.h
//  BytalkApp
//
//  Created by zhihuiguan on 13-8-12.
//  Copyright (c) 2013年 zhihuiguan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Emojize)
- (NSString *)emojizedString;
- (NSString *)stringWithEmoji;
+ (NSString *)emojizedStringWithString:(NSString *)text;
+ (NSDictionary *)emojiAliases;
@end
