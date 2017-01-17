//
//  YUSwitchView.h
//  YUSwitch
//
//  Created by 于博洋 on 2017/1/17.
//  Copyright © 2017年 于博洋. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    YUSwitchViewStateLeft,
    YUSwitchViewStateRight,
} YUSwitchViewState;

@interface YUSwitchView : UIView

@property (nonatomic,assign,readonly) YUSwitchViewState state;

@end
