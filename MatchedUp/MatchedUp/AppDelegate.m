//
//  AppDelegate.m
//  MatchedUp
//
//  Created by Charles McQuilkin on 11/14/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import "AppDelegate.h"
#import <FacebookSDK/FacebookSDK.h>
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@implementation AppDelegate

// FBSample logic
// If we have a valid session at the time of openURL call, we handle Facebook transitions
// by passing the url argument to handleOpenURL; see the "Just Login" sample application for
// a more detailed discussion of handleOpenURL
//- (BOOL)application:(UIApplication *)application
//            openURL:(NSURL *)url
//  sourceApplication:(NSString *)sourceApplication
//         annotation:(id)annotation {
//    // attempt to extract a token from the url
//    return [FBAppCall handleOpenURL:url
//                    fallbackHandler:^(FBAppCall *call) {
//                        NSLog(@"In fallback handler");
//                    }];
//}
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                        withSession:[PFFacebookUtils session]];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // FBSample logic
    // if the app is going away, we close the session object
    [FBSession.activeSession close];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //    // If you have not added the -ObjC linker flag, you may need to uncomment the following line because
    //    // Nib files require the type to have been loaded before they can do the wireup successfully.
    //    // http://stackoverflow.com/questions/1725881/unknown-class-myclass-in-interface-builder-file-error-at-runtime
    //    // [FBProfilePictureView class];
    //
    //    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //    // Override point for customization after application launch.
    //    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    //        self.window.rootViewController = [[HFViewController alloc] initWithNibName:@"HFViewController_iPhone" bundle:nil];
    //    } else {
    //        self.window.rootViewController = [[HFViewController alloc] initWithNibName:@"HFViewController_iPad" bundle:nil];
    //    }
    //
    //    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    [Parse setApplicationId:@"Ze2KJ818tQRGj2nctBCW7jNYiIEYDCt5whL92Amh"
                  clientKey:@"HDsgtqfLhcIHsL6J7hLiNaC4kVjp2XZf4wkyNLv4"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    [PFFacebookUtils initializeFacebook];
    
    
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // FBSample logic
    // Call the 'activateApp' method to log an app event for use in analytics and advertising reporting.
    //[FBAppEvents activateApp];
    //[FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
    
    // FBSample logic
    // We need to properly handle activation of the application with regards to SSO
    //  (e.g., returning from iOS 6.0 authorization dialog or from fast app switching).
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
}

@end

