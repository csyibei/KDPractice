//
//  UIViewController+Tracking.m
//  KDPractice
//
//  Created by csyibei on 2017/3/30.
//  Copyright © 2017年 KaiDiL. All rights reserved.
//

#import "UIViewController+Tracking.h"
#import <objc/runtime.h>
@implementation UIViewController (Tracking)


+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzingSelector = @selector(kd_viewDidAppear:);
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzingMethod = class_getInstanceMethod(class, swizzingSelector);
        if(class_addMethod(class, originalSelector, method_getImplementation(swizzingMethod), method_getTypeEncoding(swizzingMethod))){
            class_replaceMethod(class, swizzingSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        }else{
            method_exchangeImplementations(originalMethod, swizzingMethod);
        }
    });
}


- (void)kd_viewDidAppear:(BOOL)animated
{
    [self kd_viewDidAppear:animated];
    NSLog(@"++++");
}

@end
