//
//  NSString+Addition.m
//  BytalkApp
//
//  Created by zhihuiguan on 13-2-25.
//  Copyright (c) 2013年 zhihuiguan. All rights reserved.
//

#import "NSString+Addition.h"

@implementation NSString (Addition)



+ (NSString *) getCurrentTime {
    
	NSDate *nowUTC = [NSDate date];
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	[dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
	return [dateFormatter stringFromDate:nowUTC];
	
}

- (NSString *) substituteEmoticons {
	
	//See http://www.easyapns.com/iphone-emoji-alerts for a list of emoticons available
	
	NSString *res = [self stringByReplacingOccurrencesOfString:@":)" withString:@"\ue415"];
	res = [res stringByReplacingOccurrencesOfString:@":(" withString:@"\ue403"];
	res = [res stringByReplacingOccurrencesOfString:@";-)" withString:@"\ue405"];
	res = [res stringByReplacingOccurrencesOfString:@":-x" withString:@"\ue418"];
	
	return res;
	
}

- (NSString *)prp_URLEncodedFormStringUsingEncoding:(NSStringEncoding)enc {
    NSString *escapedStringWithSpaces =
    [self prp_percentEscapedStringWithEncoding:enc
                          additionalCharacters:@"&=+"
                             ignoredCharacters:nil];
    return escapedStringWithSpaces;
}

- (NSString *)prp_percentEscapedStringWithEncoding:(NSStringEncoding)enc
                              additionalCharacters:(NSString *)add
                                 ignoredCharacters:(NSString *)ignore {
    CFStringEncoding convertedEncoding =
    CFStringConvertNSStringEncodingToEncoding(enc);
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                kCFAllocatorDefault,
                                                                (CFStringRef)self,
                                                                (CFStringRef)ignore,
                                                                (CFStringRef)add,
                                                                convertedEncoding))
            ;
}

- (NSString *)stringCleanedForXML // in an NSString category
{
    unichar character;
    NSInteger index, len = [self length];
    NSMutableString *cleanedString = [[NSMutableString alloc] init];
    
    for (index = 0; index < len; index++)
    {
        character = [self characterAtIndex:index];
        
        if (character == 0x9 ||
            character == 0xA ||
            character == 0xD ||
            (character >= 0x20 && character <= 0xD7FF) ||
            (character >= 0xE000 && character <= 0xFFFD) ||
            (character >= 0x10000 && character <= 0x10FFFF))
            [cleanedString appendFormat:@"%C", character];
    }
    
    return cleanedString;
}
@end
