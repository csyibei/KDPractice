//
//  AppDelegate.h
//  KDPractice
//
//  Created by csyibei on 2017/3/30.
//  Copyright © 2017年 KaiDiL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

