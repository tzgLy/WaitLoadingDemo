//
//  ViewController.m
//  WaitLoadingDemo
//
//  Created by 田智广 on 2017/12/27.
//  Copyright © 2017年 田智广. All rights reserved.
//

#import "ViewController.h"
#import "LSWaitingView.h"

@interface ViewController (){
    
    LSWaitingView    *_waitingView;
}



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    _waitingView = [[LSWaitingView alloc] initWithCenterLocation:self.view.center];
    
    [_waitingView setTitle:@"加载中"];
    [self.view addSubview:_waitingView];
    
}


- (IBAction)startBtnClick:(id)sender {
    
    if (_waitingView ) {
        [_waitingView startAnimation];
    }
    
}
- (IBAction)stopBtnClick:(id)sender {
    
    if (_waitingView ) {
        [_waitingView stopAnimation];
    }
    
}


@end
