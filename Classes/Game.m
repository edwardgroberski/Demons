//
//  Game.m
//  Demons
//
//  Created by Eddie Groberski on 11/14/11.
//  Copyright 2011 Eddie Groberski. All rights reserved.
//

#import "Game.h"
#import "GameOver.h"
#import "Demon.h"
#import "DemonsViewController.h"
#import "DemonsAppDelegate.h"
#include "GameScreen.h"
#include <stdlib.h>
#define FramesPerSecond (1/100)

@implementation Game

@synthesize demonCountLabel;
@synthesize puzzleCount;
@synthesize timeLabel;
@synthesize gameOverScreen;

-(id)initWithCoder:(NSCoder *)aDecoder
{
	//NSLog(@"view: initWithCoder\n");
	
    if ((self = [super initWithCoder:aDecoder]))
	{
		[self levelOne];
		levelCount = 1;

	
		
		//creates and fires timer every second
		
		myTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self	selector:@selector(timerController) userInfo:nil repeats:YES];
		
    }

	
	// Install a timer
	// This triggers the game loop a framerate
	[NSTimer scheduledTimerWithTimeInterval: FramesPerSecond target:self selector:@selector(gameLoop) userInfo:nil repeats:YES];
	
	
	// play a single call
	//AudioServicesPlaySystemSound(levelCompleteSound);
	
	
	
	return self;
}


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.

    }
    return self;
}


- (void)timerController {
	if(myTimer !=nil){
	timeLabel.text = [self getTimeStr: seconds];
	seconds++;
	}
	//[[self timeLabel] setText:[self getTimeStr]];
}

- (NSString*)getTimeStr : (int) secondsElapsed {
	if(myTimer !=nil){
		
	seconds = secondsElapsed % 60;
	minutes = secondsElapsed / 60;
	}	
	return [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
}



-(void) gameLoop
{
	
	float deltaY;
	float deltaX;
	
	if(  DemonFound != 0 )
	{
		deltaX = currTouchPt.x - startTouchPt.x;
		deltaY = currTouchPt.y - startTouchPt.y;
		DemonFound.x += deltaX;
		DemonFound.y += deltaY;
		startTouchPt.x = currTouchPt.x;
		startTouchPt.y = currTouchPt.y;
	}

	for (int i = 0; i < activeDemons; i++){
		if ((plist[i] != DemonFound) && (plist[i] != NULL)) { 
			CGRect rect1 = CGRectMake(plist[i].x, plist[i].y, 
									  plist[i].width, plist[i].height); 
			CGRect rect2 = CGRectMake(DemonFound.x, DemonFound.y, 
									  DemonFound.width, DemonFound.height); 
			if (CGRectIntersectsRect(rect1, rect2) == 1) 
			{ NSLog(@"The rectangles intersect"); 
				currTouchPt.x = prevTouchPt.x;
				currTouchPt.y = prevTouchPt.y;
			} 
		}
	} 
	

	
	//Clamp play field and check if demons are in hole
	for (int i = 0; i < activeDemons; i++){
		if (plist[i] != NULL){
			[self clampPlayField: plist[i]];
			[self holeCheck: plist[i]];
		}
	}
	
	//[self gameOver];
	//Check if all demons are removed
	int nullCount = 0;
	for(int i = 0; i <activeDemons; i++)
	{	
		if(plist[i] == NULL)
		{
			nullCount++;
		}
	}
	
	//Run Game Over behavior if all demons are removed
	if (nullCount == activeDemons)
	{
		[self gameOver];
	}

	
	[self setNeedsDisplay];
	//[self updatePuzzleCount];	
}



-(Demon *)findDemon
{
	// check all the Demons
	for (int i = 0; i < activeDemons; i++){	
		if( (startTouchPt.x >= plist[i].x) && startTouchPt.x <= (plist[i].x + plist[i].width) &&
		   (startTouchPt.y >= plist[i].y) && startTouchPt.y <= (plist[i].y + plist[i].height) )
		{
			return plist[i];
		}
	}
	return 0;
}



-(void) clampPlayField: (Demon *) demonToCheck
{
	if( (demonToCheck.x + demonToCheck.width) > 300 )
	{
		demonToCheck.x = 300 - demonToCheck.width;
	}
	if( (demonToCheck.x ) < 0 )
	{
		demonToCheck.x = 0;
	}
	if( (demonToCheck.y + demonToCheck.height) > 375 )
	{
		demonToCheck.y = 375 - demonToCheck.height;
	}
	if( (demonToCheck.y) < 0 )
	{
		demonToCheck.y = 0;
	}
}






-(void) levelOne
{
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	NSInteger demonNum = [prefs integerForKey:@"demonNumKey"];
	activeDemons = demonNum;
	demonsDead = demonNum;

	
	for (int i = 0; i < activeDemons; i++){
		int randomX = arc4random() % 270;
		int randomY = arc4random() % 250;
		plist[i] = [[Demon alloc] init];
		plist[i].x = randomX;
		plist[i].y = randomY;
		plist[i].width = 30;
		plist[i].height = 30;	
		plist[i].r = 1;
		plist[i].g = 0;
		plist[i].b = 0;
		plist[i].a = 0.75;
	}	
}	
	

-(void) demonMovement: (Demon *) demonToMove{
	int demonX = demonToMove.x;
	int demonY  = demonToMove.y;
	int movement = 6;
	
	if(demonX % 2 == 0)
	{
	demonToMove.x = demonToMove.x + movement;
	}
	else {
		demonToMove.x = demonToMove.x - movement;
	}

	if(demonY % 2 == 0)
	{
		demonToMove.y = demonToMove.y + movement;
	}
	else {
		demonToMove.y = demonToMove.y - movement;
	}
}


-(void) holeCheck: (Demon *) demonToCheck
{
	if((demonToCheck.x > 100) &&
	   (demonToCheck.x + demonToCheck.width) < 200 &&
	   ((demonToCheck.y + (demonToCheck.height/2)) > 325))
	{
		//demon is in hole to hell
		NSLog(@"IN THE HOLE"); 
		NSLog(@"DEMON X: %i  Y: %i \n",demonToCheck.x,demonToCheck.y); 
		[self removeDemon: demonToCheck];
	}
}

-(void) removeDemon: (Demon *) demonToRemove
{
	for(int i = 0; i <activeDemons; i++)
	{	
		if(plist[i] == DemonFound){
			plist[i] = NULL;
			[self updateMoveLabel];
		}	
	}
}


-(void)gameOver
{	
	myTimer= nil;
	[myTimer invalidate];
	
	[myTimer release];
	[self switchToGameOverScreen];
		
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
-(void)drawRect:(CGRect)rect 
{
	UIImage *demon_image =  [UIImage imageNamed:@"demonSprite.png"]; 
	
	for (int i = 0; i < activeDemons; i++){
	
		[demon_image drawInRect:CGRectMake(plist[i].x, plist[i].y, plist[i].width, plist[i].height)]; 
	}
}


-(void) updateMoveLabel
{
	demonsDead--;
	demonCountLabel.text = [NSString stringWithFormat:@"%i", demonsDead];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
	
	NSArray *pTouches = [touches allObjects];
	UITouch *first = [pTouches objectAtIndex:0];
	
	CGPoint pt = [first locationInView:self];
	
	startTouchPt.x = pt.x;
	startTouchPt.y = pt.y;
	
	currTouchPt.x = pt.x;
	currTouchPt.y = pt.y;
	
	prevTouchPt.x = pt.x;
	prevTouchPt.y = pt.y;
	
	DemonFound = [self findDemon];
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event 
{
	//NSLog(@"Touch moved\n");
	
	NSArray *pTouches = [touches allObjects];
	UITouch *first = [pTouches objectAtIndex:0];
	
	CGPoint pt = [first locationInView:self];
	
	
	int chance = arc4random() % 100;
	NSLog(@"Chance %i\n", chance);
	if (chance >= 80) {
		for(int i = 0; i <activeDemons; i++)
		{	
			if(plist[i] == DemonFound){
				[self demonMovement: plist[i]];
			}	
		}
		
		int chance2 = arc4random() % 100;
		if (chance2 >= 80)
		{
			DemonFound = 0;
		}
	}else{
		prevTouchPt.x = currTouchPt.x;
		prevTouchPt.y = currTouchPt.y;
	
		currTouchPt.x = pt.x;
		currTouchPt.y = pt.y;
	}
	
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event 
{
	NSArray *pTouches = [touches allObjects];
	UITouch *first = [pTouches objectAtIndex:0];
	
	CGPoint pt = [first locationInView:self];
	
	endTouchPt.x = pt.x;
	endTouchPt.y = pt.y;
	
	DemonFound = 0;
}






- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event 
{
	NSLog(@"Touch cancel\n");
}


-(void)switchToGameOverScreen
{
	UIImage *gameOverImage = [UIImage imageNamed: @"gameOverSplash.png"];    
	UIImageView *imageView = [[UIImageView alloc] initWithImage: gameOverImage]; 
	[self addSubview: imageView]; 
	[imageView release];
}



// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization.
 }
 return self;
 }
 */

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 UIImage *background = [UIImage imageNamed: @"GameBackground.png"];    
 UIImageView *imageView = [[UIImageView alloc] initWithImage: background]; 
 [self addSubview: imageView]; 
 [imageView release];
 [super viewDidLoad];
 }
 */

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

/*
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}
 */
 /*
- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
 */

- (void)dealloc {
	for (int i = 0; i < activeDemons; i++){
		[plist[i] release];
	}
    [super dealloc];
}


@end

