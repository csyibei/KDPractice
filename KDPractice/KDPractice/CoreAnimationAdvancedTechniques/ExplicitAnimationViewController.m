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
@property (nonatomic,strong) CALayer *kaiDiLayer;
@property (nonatomic,strong) UIBezierPath *movePath;

@end

@implementation ExplicitAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self animationPath];
    // Do any additional setup after loading the view from its nib.
    self.aLayer = [CALayer layer];
    self.aLayer.frame = CGRectMake(0, 0, 100, 100);
    self.aLayer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.aView.layer addSublayer:self.aLayer];
    
}

- (void)beginTransformAnimation
{
    CABasicAnimation *transformAnimation = [CABasicAnimation animation];
    transformAnimation.keyPath = @"transform.rotation";
    transformAnimation.duration = 2.0f;
    transformAnimation.byValue = @(M_PI);
//    [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];
//    [NSValue valueWithCGAffineTransform:CGAffineTransformMakeRotation(M_PI_4)];
    [_kaiDiLayer addAnimation:transformAnimation forKey:nil];
}

- (void)animationPath
{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(50, 100)];
    [path addCurveToPoint:CGPointMake(300, 100) controlPoint1:CGPointMake(150, 0) controlPoint2:CGPointMake(200, 200)];
    self.movePath = path;
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.path = path.CGPath;
    shape.strokeColor = [UIColor orangeColor].CGColor;
    shape.fillColor = [UIColor clearColor].CGColor;
    [self.view.layer addSublayer:shape];
    _kaiDiLayer = [CALayer layer];
    _kaiDiLayer.frame = CGRectMake(0, 0, 44, 44);
    _kaiDiLayer.contents = (__bridge id)[UIImage imageNamed:@"WechatIMG6131"].CGImage;
    _kaiDiLayer.position = CGPointMake(50, 100);
    [self.view.layer addSublayer:_kaiDiLayer];
}

- (void)beginAnimation
{
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.keyPath = @"position";
    keyAnimation.duration = 3.0f;
    keyAnimation.path = self.movePath.CGPath;
    keyAnimation.rotationMode = @"auto";
    keyAnimation.delegate = self;
    [_kaiDiLayer addAnimation:keyAnimation forKey:nil];
}

- (IBAction)changeColorClick:(id)sender {
//     [self beginAnimation];
    [self beginTransformAnimation];
//    CABasicAnimation *ani = [CABasicAnimation animation];
//    CGFloat randomRed = arc4random() / (CGFloat)INT_MAX;
//    CGFloat randomGreen = arc4random() / (CGFloat)INT_MAX;
//    CGFloat randomBlue = arc4random() / (CGFloat)INT_MAX;
//    ani.keyPath = @"backgroundColor";
////    ani.fillMode = @"forwards";
////    ani.removedOnCompletion = NO;
////    ani.keyPath = @"transform.rotation";
//    ani.toValue = (__bridge id)[UIColor colorWithRed:randomRed green:randomGreen blue:randomBlue alpha:1.0].CGColor;
////    ani.byValue = @(M_PI_4);
//    ani.delegate = self;
////    self.aLayer.backgroundColor = [UIColor colorWithRed:randomRed green:randomGreen blue:randomBlue alpha:1.0].CGColor;
//    [self.aLayer addAnimation:ani forKey:nil];
}

#pragma mark - <CAAnimationDelegate>
- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag
{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
//    [CATransaction setAnimationDuration:10.0f];
//    self.aLayer.backgroundColor = (__bridge CGColorRef)anim.toValue;
//    self.aLayer.backgroundColor = [UIColor redColor].CGColor;
    [CATransaction commit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
