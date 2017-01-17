//
//  ViewController.m
//  YUSwitch
//
//  Created by 于博洋 on 2017/1/17.
//  Copyright © 2017年 于博洋. All rights reserved.
//

#import "ViewController.h"
#import "YUSwitchView.h"

@interface ViewController ()

@property (nonatomic,strong)YUSwitchView * switchView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.switchView];
}


- (YUSwitchView *)switchView {
    if (_switchView == nil) {
        _switchView = [[YUSwitchView alloc] init];
        _switchView.frame = CGRectMake(100, 200, 140, 64);
        
    }
    return _switchView;
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
