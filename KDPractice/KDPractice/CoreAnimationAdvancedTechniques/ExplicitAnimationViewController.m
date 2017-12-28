//
//  ExplicitAnimationViewController.m
//  KDPractice
//
//  Created by csyibei on 2017/12/15.
//  Copyright © 2017年 KaiDiL. All rights reserved.
//

#import "ExplicitAnimationViewController.h"

@interface ExplicitAnimationViewController ()<CAAnimationDelegate>

@property (weak, nonatomic) IBOutlet UIView *aView;
@property (nonatomic,strong) CALayer *aLayer;
@end

@implementation ExplicitAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.aLayer = [CALayer layer];
    self.aLayer.frame = CGRectMake(0, 0, 100, 100);
    self.aLayer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.aView.layer addSublayer:self.aLayer];
}

- (IBAction)changeColorClick:(id)sender {
    CABasicAnimation *ani = [CABasicAnimation animation];
    CGFloat randomRed = arc4random() / (CGFloat)INT_MAX;
    CGFloat randomGreen = arc4random() / (CGFloat)INT_MAX;
    CGFloat randomBlue = arc4random() / (CGFloat)INT_MAX;
    ani.keyPath = @"backgroundColor";
    ani.toValue = (__bridge id)[UIColor colorWithRed:randomRed green:randomGreen blue:randomBlue alpha:1.0].CGColor;
    ani.delegate = self;
    [self.aLayer addAnimation:ani forKey:nil];
}

#pragma mark - <CAAnimationDelegate>
- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag
{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
//    [CATransaction setAnimationDuration:5.0f];
    self.aLayer.backgroundColor = (__bridge CGColorRef)anim.toValue;
    [CATransaction commit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
