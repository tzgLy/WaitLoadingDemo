//
//  AppDelegate.h
//  WaitLoadingDemo
//
//  Created by 田智广 on 2017/12/27.
//  Copyright © 2017年 田智广. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

