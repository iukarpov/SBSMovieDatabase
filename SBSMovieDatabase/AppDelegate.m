//
//  AppDelegate.m
//  SBSMoviewDatabase
//
//  Created by Igor on 24/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "AppDelegate.h"
#import "SBSHomeViewController.h"
#import "UIColor+SBSCustomColors.h"


@interface AppDelegate ()

@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen.mainScreen bounds]];
    SBSHomeViewController *startViewController = [SBSHomeViewController new];
    UINavigationController *appNavigationController = [[UINavigationController alloc] initWithRootViewController:startViewController];
    appNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:72/255.0 green:74/255.0 blue:81/255.0 alpha:1.0];
    [appNavigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    appNavigationController.navigationBar.tintColor = [UIColor primaryTextColor];
    appNavigationController.navigationBar.shadowImage = [UIImage new];
    appNavigationController.navigationBar.translucent = NO;    
    self.window.rootViewController = appNavigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
}
@end
