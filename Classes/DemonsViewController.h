//
//  DemonsViewController.h
//  Demons
//
//  Created by Eddie Groberski on 11/14/11.
//  Copyright Eddie Groberski. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MenuScreen;

@interface DemonsViewController : UIViewController {
	MenuScreen *mainMenu;
	NSNumber *activeDemons;
}
@property (nonatomic, retain) NSNumber *activeDemons;
@property (nonatomic,retain) MenuScreen *mainMenu;
-(IBAction) switchToMainMenu: (id) sender;
-(void) switchToMain;

@end

