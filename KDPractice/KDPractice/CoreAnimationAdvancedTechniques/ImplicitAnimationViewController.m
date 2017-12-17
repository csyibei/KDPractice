//
//  ImplicitAnimationViewController.m
//  KDPractice
//
//  Created by csyibei on 2017/12/17.
//  Copyright © 2017年 KaiDiL. All rights reserved.
//

#import "ImplicitAnimationViewController.h"

@interface ImplicitAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIView *aView;
@property (nonatomic,strong) CALayer *colorLayer;
@property (nonatomic,strong) CALayer *hitTestLayer;
@end

@implementation ImplicitAnimationViewController
{
    int _count;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _count = 0;
    [UIView animateWithDuration:1.0f animations:^{
        
    }];
    self.aView.backgroundColor = [UIColor redColor];
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50, 50, 50, 50);
    self.colorLayer.backgroundColor = [UIColor orangeColor].CGColor;
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    self.colorLayer.actions = @{@"backgroundColor" : transition};
    [self.aView.layer addSublayer:self.colorLayer];
//    self.colorLayer.delegate = self;
    self.hitTestLayer = [CALayer layer];
    self.hitTestLayer.frame = CGRectMake(0, 0, 50, 50);
    self.hitTestLayer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:self.hitTestLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    if ([self.hitTestLayer.presentationLayer hitTest:point]) {
        self.hitTestLayer.backgroundColor = [UIColor colorWithRed:arc4random() / INT_MAX green:arc4random() / INT_MAX blue:arc4random() / INT_MAX alpha:1.0f].CGColor;
    }else{
        [CATransaction begin];
        [CATransaction setAnimationDuration:4.0f];
        self.hitTestLayer.position = point;
        [CATransaction commit];
    }
}

- (IBAction)changeColorClick:(id)sender {
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        self.colorLayer.affineTransform = CGAffineTransformMakeRotation(M_PI_4);
//        CGAffineTransform transform = self.colorLayer.affineTransform;
//        transform = CGAffineTransformRotate(transform, M_PI_2);
//        self.colorLayer.affineTransform = transform;
    }];
    
    UIColor *col1 = [UIColor greenColor];
    UIColor *col2 = [UIColor blackColor];
    UIColor *col3 = [UIColor yellowColor];
    UIColor *col4 = [UIColor grayColor];
    NSArray *colArr = @[col1,col2,col3,col4];
    CGColorRef currentCol = (CGColorRef)[colArr[_count] CGColor];
    [CATransaction setAnimationDuration:1.0f];
    self.colorLayer.backgroundColor = (CGColorRef)currentCol;
//    [UIColor colorWithRed:arc4random() / INT_MAX green:arc4random() / INT_MAX blue:arc4random() / INT_MAX alpha:1.0f].CGColor;
    [CATransaction  commit];
    if (_count == 3) {
        _count = 0;
    }else{
        _count++;
        
    }
}


@end
