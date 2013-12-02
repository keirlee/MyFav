//
//  UITableViewCell+Addition.h
//  ChildrenDemo
//
//  Created by zhihuiguan on 13-1-25.
//  Copyright (c) 2013年 zhihuiguan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Addition)
+ (id)dequeOrCreateInTable:(UITableView*)tableView withId: (NSString*)reuseId andStyle:(UITableViewCellStyle)style;
+(id)dequeOrCreateInTable:(UITableView*)tableView withId: (NSString*)reuseId nibName:(NSString*)nibName;
@end
