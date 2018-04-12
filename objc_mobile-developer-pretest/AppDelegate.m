//
//  AppDelegate.m
//  objc_mobile-developer-pretest
//
//  Created by Lin Cheng Lung on 10/04/2018.
//  Copyright © 2018 Lin Cheng Lung. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self setupRootViewController];

    return YES;
}

- (void)setupRootViewController {
    UIViewController *viewController = [[ViewController alloc] init];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
}

@end
