//
//  DemonsAppDelegate.h
//  Demons
//
//  Created by Eddie Groberski on 11/14/11.
//  Copyright Eddie Groberski. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DemonsViewController;
@class Settings;

@interface DemonsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DemonsViewController *viewController;
	NSNumber *activeDemons;
}
@property (nonatomic, retain) IBOutlet NSNumber *activeDemons;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DemonsViewController *viewController;


@end

