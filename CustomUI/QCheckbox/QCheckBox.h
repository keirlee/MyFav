//
//  EICheckBox.h
//  EInsure
//
//  Created by ivan on 13-7-9.
//  Copyright (c) 2013年 ivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QCheckBoxDelegate;

@interface QCheckBox : UIButton {
    
    BOOL _checked;
}

@property(nonatomic, weak)id<QCheckBoxDelegate> delegate;
@property(nonatomic, assign)BOOL checked;

- (id)initWithDelegate:(id)delegate;
- (id)initWithDelegate:(id)delegate andUnCheckImage:(UIImage *)uncheckImage andCheckedImage:(UIImage *)checkedImage;
@end

@protocol QCheckBoxDelegate <NSObject>

@optional

- (void)didSelectedCheckBox:(QCheckBox *)checkbox checked:(BOOL)checked;

@end
