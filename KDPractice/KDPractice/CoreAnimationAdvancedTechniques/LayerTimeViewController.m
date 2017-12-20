//
//  LayerTimeViewController.m
//  KDPractice
//
//  Created by csyibei on 2017/12/20.
//  Copyright © 2017年 KaiDiL. All rights reserved.
//

#import "LayerTimeViewController.h"

@interface LayerTimeViewController ()

@end

@implementation LayerTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *timeLayer = [CALayer layer];
    timeLayer.frame = CGRectMake(100, 100, 50, 50);
    timeLayer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:timeLayer];
    
    CABasicAnimation *timeAnimation = [CABasicAnimation animation];
    timeAnimation.keyPath = @"transform.rotation";
    timeAnimation.toValue = @(M_PI_4);
    timeAnimation.duration = 2.f;
    timeAnimation.repeatCount = 3.f;
    timeAnimation.fillMode = @"forwards";
    timeAnimation.removedOnCompletion = NO;
    [timeLayer addAnimation:timeAnimation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
