//
//  AppDelegate.m
//  TouchTracker
//
//  Created by Rodney Sampson on 9/15/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

#import "AppDelegate.h"
#import "DrawView.h"

@interface AppDelegate ()

@property (nonatomic) DrawView *drawView;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIViewController *vc = self.window.rootViewController;
    DrawView *dv = (DrawView *)vc.view;
    self.drawView = dv;
    DrawView *dvvc = (DrawView *)vc.view;
    dvvc.finishedLines = dv.finishedLines;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"\n\n\n\n\n%@", NSStringFromSelector(_cmd));
    BOOL success = [self.drawView saveFinishedLines];
    if (success) {
        NSLog(@"Saved %lu items to disk.", (unsigned long)self.drawView.finishedLines.count);
    } else {
        NSLog(@"Failed to save the items to disk.");
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
