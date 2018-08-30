//
//  TimerBaseAnimationViewController.m
//  KDPractice
//
//  Created by csyibei on 2017/12/25.
//  Copyright © 2017年 KaiDiL. All rights reserved.
//

#import "TimerBaseAnimationViewController.h"

@interface TimerBaseAnimationViewController ()
@property (nonatomic,strong) UIImageView *ballView;
@property (nonatomic,strong) NSTimer *ballTimer;
@property (nonatomic,assign) CGFloat duration;
@property (nonatomic,assign) CGFloat timeOffset;
@end

@implementation TimerBaseAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ballView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.ballView.image = [UIImage imageNamed:@"ball.png"];
    [self.view addSubview:self.ballView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)timeAnimation
{
    if (self.ballTimer) {
        [self.ballTimer  invalidate];
    }
    self.duration = 2.0f;
    self.timeOffset = 0.f;
    self.ballTimer = [NSTimer timerWithTimeInterval:1 / 60 target:self selector:@selector(ballRun) userInfo:nil repeats:YES];
}

- (void)ballRun
{
    NSArray *a = @[@"kidi"];
    NSMutableArray  *b = a.copy;
    NSLog(@"%@",b);
}

- (id)interpolateFromValue:(id)fromValue toValue:(id)toValue time:(float)time
{
    if ([fromValue isKindOfClass:[NSValue class]]) {
        //get type
        const char *type = [(NSValue *)fromValue objCType];
        if (strcmp(type, @encode(CGPoint)) == 0) {
            CGPoint from = [fromValue CGPointValue];
            CGPoint to = [toValue CGPointValue];
            CGPoint result = CGPointMake(interpolate(from.x, to.x, time), interpolate(from.y, to.y, time));
            return [NSValue valueWithCGPoint:result];
        }
    }
    //provide safe default implementation
    return (time < 0.5)? fromValue: toValue;
}

float interpolate(float from, float to, float time)
{
    return (to - from) * time + from;
}

float bounceEaseOut(float t)
{
    if (t < 4/11.0) {
        return (121 * t * t)/16.0;
    } else if (t < 8/11.0) {
        return (363/40.0 * t * t) - (99/10.0 * t) + 17/5.0;
    } else if (t < 9/10.0) {
        return (4356/361.0 * t * t) - (35442/1805.0 * t) + 16061/1805.0;
    }
    return (54/5.0 * t * t) - (513/25.0 * t) + 268/25.0;
}


@end
