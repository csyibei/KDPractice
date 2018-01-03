//
//  LayerTimeViewController.m
//  KDPractice
//
//  Created by csyibei on 2017/12/20.
//  Copyright © 2017年 KaiDiL. All rights reserved.
//

#import "LayerTimeViewController.h"

@interface LayerTimeViewController ()
@property (nonatomic,strong) CALayer *timeLayer;
@end

@implementation LayerTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _timeLayer = [CALayer layer];
    _timeLayer.frame = CGRectMake(100, 100, 50, 50);
    _timeLayer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:_timeLayer];
    
   
}

- (IBAction)beginAnimationClick:(id)sender {
    [self beginTimeAnimation];
}

- (void)beginTimeAnimation
{
    CABasicAnimation *timeAnimation = [CABasicAnimation animation];
    timeAnimation.keyPath = @"transform.rotation";
    timeAnimation.toValue = @(M_PI_4);
    //    timeAnimation.speed = 2.f;
    timeAnimation.duration = 1.f;
    //    timeAnimation.timeOffset = 2.f;
    timeAnimation.beginTime = 2.f;
    //    timeAnimation.repeatCount = 3.f;
    //    timeAnimation.repeatDuration = 4.f;
    timeAnimation.fillMode = @"both";
    timeAnimation.removedOnCompletion = NO;
    [_timeLayer addAnimation:timeAnimation forKey:nil];
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
