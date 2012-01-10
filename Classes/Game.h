//
//  Game.h
//  Demons
//
//  Created by Eddie Groberski on 11/14/11.
//  Copyright 2011 Eddie Groberski. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <AudioToolbox/AudioToolbox.h>
@class Demon;
@class GameOver;
@interface Game : UIView {
		Demon *plist[10];
		int activeDemons;
		int demonsDead;
	
		NSDate *currentDateTime;
		NSDateFormatter *dateFormatter;
	
		NSTimer *myTimer;
		int seconds;
		int minutes;
		
		Demon *DemonFound;
		GameOver *gameOverScreen;
		
		NSInteger moveCount;
		NSInteger levelCount;
		
		CGPoint startTouchPt;
		CGPoint prevTouchPt;
		CGPoint currTouchPt;
		CGPoint endTouchPt;
		
		SystemSoundID DemonMovedSound;
		SystemSoundID levelCompleteSound;
		SystemSoundID woodWhackSound;
		
		UILabel *demonCountLabel;	
		UILabel *puzzleCount;
		UILabel *timeLabel;
}
	
@property (nonatomic, retain) IBOutlet UILabel *demonCountLabel;
@property (nonatomic, retain) GameOver *gameOverScreen;	
@property (nonatomic, retain) IBOutlet UILabel *puzzleCount;
@property (nonatomic, retain) IBOutlet UILabel *timeLabel;
	
-(void) levelOne;
-(void) updateMoveLabel;
-(void)gameOver;
-(Demon *)findDemon;
-(void) gameLoop;
-(void) clampPlayField: (Demon *) demon;
-(void) removeDemon: (Demon *) demonToRemove;
-(void) demonMovement: (Demon *) demonToMove;
-(void) holeCheck: (Demon *) demonToCheck;
-(void)switchToGameOverScreen;	
- (void)timerController;
- (NSString*)getTimeStr : (int) secondsElapsed ;









@end
