//
//  UITableViewCell+Addition.m
//  ChildrenDemo
//
//  Created by zhihuiguan on 13-1-25.
//  Copyright (c) 2013年 zhihuiguan. All rights reserved.
//

#import "UITableViewCell+Addition.h"

@implementation UITableViewCell (Addition)
+ (id)dequeOrCreateInTable:(UITableView*)tableView withId: (NSString*)reuseId andStyle:(UITableViewCellStyle)style {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:style reuseIdentifier:reuseId];
    }
    return cell;
}

+(id)dequeOrCreateInTable:(UITableView*)tableView withId: (NSString*)reuseId nibName:(NSString*)nibName{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
        return [nib objectAtIndex:0];
    }
    return cell;
}
@end
