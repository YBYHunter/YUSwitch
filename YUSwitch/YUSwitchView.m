//
//  YUSwitchView.m
//  YUSwitch
//
//  Created by 于博洋 on 2017/1/17.
//  Copyright © 2017年 于博洋. All rights reserved.
//

#import "YUSwitchView.h"

static NSInteger const ImageSpacing = 5;

@interface YUSwitchView ()

@property (nonatomic,strong) UISwipeGestureRecognizer * recognizerLeft;
@property (nonatomic,strong) UISwipeGestureRecognizer * recognizerRight;
@property (nonatomic,strong) UITapGestureRecognizer * tapRecognizer;
@property (nonatomic,strong) UIImageView * iconImageView;

@end


@implementation YUSwitchView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        
        self.state = YUSwitchViewStateLeft;
        
        [self addGestureRecognizer:self.recognizerLeft];
        [self addGestureRecognizer:self.recognizerRight];
        [self addGestureRecognizer:self.tapRecognizer];
        [self addSubview:self.iconImageView];
        
    }
    return self;
}


- (void)layoutSubviews {
    CGFloat sizeWidth = self.frame.size.height - ImageSpacing * 2;
    self.iconImageView.frame = CGRectMake(ImageSpacing, ImageSpacing, sizeWidth, sizeWidth);
    
}

#pragma mark --

-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
    if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        if (self.state == YUSwitchViewStateRight) {
            return;
        }
        [self switchDirectionWithRight];
    }
    else if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        if (self.state == YUSwitchViewStateLeft) {
            return;
        }
        [self switchDirectionWithLeft];
    }
}

- (void)tapRecognizerAction {
    if (self.state == YUSwitchViewStateRight) {
        [self switchDirectionWithLeft];
    }
    else if (self.state == YUSwitchViewStateLeft) {
        [self switchDirectionWithRight];
    }
}

#pragma mark -- 左右滑动方法

- (void)switchDirectionWithLeft {
    
    NSLog(@"switchDirectionWithLeft");
    [self.iconImageView.layer removeAllAnimations];
    [UIView animateWithDuration:0.15 animations:^{
        self.iconImageView.frame = CGRectMake(ImageSpacing, ImageSpacing, self.iconImageView.frame.size.width, self.iconImageView.frame.size.height);
    } completion:^(BOOL finished) {
        if (finished) {
            self.state = YUSwitchViewStateLeft;
        }
    }];
    
    
}

- (void)switchDirectionWithRight {
    
    NSLog(@"switchDirectionWithRight");
    [self.iconImageView.layer removeAllAnimations];
    [UIView animateWithDuration:0.15 animations:^{
        self.iconImageView.frame = CGRectMake(self.frame.size.width - ImageSpacing - self.iconImageView.frame.size.width, ImageSpacing, self.iconImageView.frame.size.width, self.iconImageView.frame.size.height);
    } completion:^(BOOL finished) {
        if (finished) {
            self.state = YUSwitchViewStateRight;
        }
    }];
    
    
}




#pragma mark -- getter

-(UIImageView *)iconImageView {
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.backgroundColor = [UIColor whiteColor];
        
    }
    return _iconImageView;
}

- (UISwipeGestureRecognizer *)recognizerRight {
    if (_recognizerRight == nil) {
        _recognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
        [_recognizerRight setDirection:(UISwipeGestureRecognizerDirectionRight)];
    }
    return _recognizerRight;
}

- (UISwipeGestureRecognizer *)recognizerLeft {
    if (_recognizerLeft == nil) {
        _recognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
        [_recognizerLeft setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    }
    return _recognizerLeft;
}

- (UITapGestureRecognizer *)tapRecognizer {
    if (_tapRecognizer == nil) {
        _tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRecognizerAction)];
    }
    return _tapRecognizer;
}

#pragma mark -- setter

- (void)setState:(YUSwitchViewState)state {
    _state = state;
}






































@end
