//
//  NSString+Emojize.m
//  BytalkApp
//
//  Created by zhihuiguan on 13-8-12.
//  Copyright (c) 2013年 zhihuiguan. All rights reserved.
//

#import "NSString+Emojize.h"

@implementation NSString (Emojize)

- (NSString *)emojizedString
{
    return [NSString emojizedStringWithString:self];
}

- (NSString *)stringWithEmoji{
    return [NSString stringWithEmojizedString:self];
}

+ (NSString *)emojizedStringWithString:(NSString *)text
{
    static dispatch_once_t onceToken;
    static NSRegularExpression *regex = nil;
    dispatch_once(&onceToken, ^{
        regex = [[NSRegularExpression alloc] initWithPattern:@"(\\[[a-z0-9-+_]+\\])" options:NSRegularExpressionCaseInsensitive error:NULL];
    });
    
    __block NSString *resultText = text;
    NSRange matchingRange = NSMakeRange(0, [resultText length]);
    [regex enumerateMatchesInString:resultText options:NSMatchingReportCompletion range:matchingRange usingBlock:
     ^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
         if ( result &&
             ([result resultType] == NSTextCheckingTypeRegularExpression) &&
             !(flags & NSMatchingInternalError) ) {
             
             NSRange range = result.range;
             if (range.location != NSNotFound) {
                 NSString *code = [text substringWithRange:range];
                 NSString *unicode = self.emojiAliases[code];
                 if (unicode)
                     resultText = [resultText stringByReplacingOccurrencesOfString:code withString:unicode];
             }
             
         }
         
     }];
    return resultText;
}


+ (NSString*)stringWithEmojizedString:(NSString*)text{
    
    NSString *resultText = text;
    
    NSArray *keys = self.aliasesEmoji.allKeys;
    
    for (NSString *key in keys) {
        resultText = [resultText stringByReplacingOccurrencesOfString:key withString:self.aliasesEmoji[key]];
    }
    return resultText;
}

+ (NSDictionary *)emojiAliases {
    static NSDictionary *_emojiAliases;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ios6emojiRevert" ofType:@"plist"];
        _emojiAliases = [NSDictionary dictionaryWithContentsOfFile:path];
    
    });
    return _emojiAliases;
}

+ (NSDictionary *)aliasesEmoji {
    static NSDictionary *_aliasesEmoji;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ios6emoji2string" ofType:@"plist"];
        _aliasesEmoji = [NSDictionary dictionaryWithContentsOfFile:path];
        
    });
    return _aliasesEmoji;
}
@end
