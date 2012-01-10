//
//  MenuScreen.h
//  Demons
//
//  Created by Eddie Groberski on 11/14/11.
//  Copyright Eddie Groberski. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GameScreen;
@class Instructions;
@class Settings;

@interface MenuScreen : UIViewController {
	GameScreen *gameScreen;
	Instructions *instructionsScreen;
	Settings *settingsScreen;
	NSNumber *activeDemons;
	UILabel *testLabel;
}
@property (nonatomic, retain) NSNumber *activeDemons;
@property (nonatomic, retain) GameScreen *gameScreen;
@property (nonatomic, retain) Instructions *instructionsScreen;
@property (nonatomic, retain) Settings *settingsScreen;
@property (nonatomic, retain) IBOutlet UILabel *testLabel;


-(IBAction) switchToGameScreen;
-(IBAction) switchToInstructionsScreen;
-(IBAction) switchToSettingsScreen;
-(IBAction) test;

@end
