//
//  EasingViewController.m
//  KDPractice
//
//  Created by csyibei on 2017/12/24.
//  Copyright © 2017年 KaiDiL. All rights reserved.
//

#import "EasingViewController.h"

@interface EasingViewController ()
@property (nonatomic,strong) CALayer *moveLayer;
@property (nonatomic,strong) UIView *moveView;
@property (nonatomic,strong) CALayer *easingLayer;
@end

@implementation EasingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.moveLayer = [CALayer layer];
    self.moveLayer.backgroundColor = [UIColor orangeColor].CGColor;
    self.moveLayer.frame = CGRectMake(100, 100, 50, 50);
    [self.view.layer addSublayer:self.moveLayer];
    
    self.moveView = [[UIView alloc] initWithFrame:CGRectMake(100, 150, 50, 50)];
    self.moveView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.moveView];
    
    [self drawEasing];
}

- (void)drawEasing
{
    self.easingLayer = [CALayer layer];
    self.easingLayer.frame = CGRectMake(200,200,200,200);
    [self.view.layer addSublayer:self.easingLayer];
    
    CAMediaTimingFunction *fun = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    CGPoint control1;
    CGPoint control2;
    [fun getControlPointAtIndex:1 values:(float *)&control1];
    [fun getControlPointAtIndex:2 values:(float *)&control2];
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointZero];
    [path addCurveToPoint:CGPointMake(1, 1) controlPoint1:control1 controlPoint2:control2];
    [path applyTransform:CGAffineTransformMakeScale(20, 20)];
    
    CAShapeLayer *shapeL = [CAShapeLayer layer];
    shapeL.path = path.CGPath;
    shapeL.fillColor = [UIColor clearColor].CGColor;
    shapeL.strokeColor = [UIColor orangeColor].CGColor;
    shapeL.lineWidth = 4.f;
    [self.easingLayer addSublayer:shapeL];
//    self.view.layer.geometryFlipped = YES;
}

- (void)keyframeColor
{
    CAKeyframeAnimation *ani = [CAKeyframeAnimation animation];
    ani.duration = 3.f;
    ani.keyPath = @"backgroundColor";
    ani.values = @[(__bridge id)[UIColor orangeColor].CGColor,
                   (__bridge id)[UIColor redColor].CGColor,
                   (__bridge id)[UIColor greenColor].CGColor,
                   (__bridge id)[UIColor orangeColor].CGColor
                   ];
    CAMediaTimingFunction *fn = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    ani.timingFunctions = @[fn,fn,fn];
    [self.moveLayer addAnimation:ani forKey:nil];
}

- (void)layerMoveWithTouches:(NSSet *)touches
{
    [CATransaction begin];
    [CATransaction setAnimationDuration:3.f];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    self.moveLayer.position = [[touches anyObject] locationInView:self.view];
    [CATransaction commit];
}

- (void)viewMoveWithTouches:(NSSet *)touches
{
    [UIView animateWithDuration:3.f delay:0.f options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.moveView.center = [[touches anyObject] locationInView:self.view];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self layerMoveWithTouches:touches];
//    [self viewMoveWithTouches:touches];
    [self keyframeColor];
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
