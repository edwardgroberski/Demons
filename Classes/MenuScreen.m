//
//  MenuScreen.m
//  Demons
//
//  Created by Eddie Groberski on 11/14/11.
//  Copyright Eddie Groberski. All rights reserved.
//

#import "MenuScreen.h"
#import "Settings.h"
#import "GameScreen.h"
#import "Instructions.h"
#import "DemonsAppDelegate.h"

@implementation MenuScreen

@synthesize gameScreen;
@synthesize instructionsScreen;
@synthesize settingsScreen;
@synthesize activeDemons;
@synthesize testLabel;



-(IBAction) switchToGameScreen
{
	gameScreen = [[GameScreen alloc] initWithNibName:@"GameScreen" bundle:nil];
	[UIView setAnimationDuration:.75]; 
	
	self.gameScreen.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
	[self presentModalViewController:self.gameScreen animated:YES];

}

-(IBAction) switchToInstructionsScreen
{
	instructionsScreen = [[Instructions alloc] initWithNibName:@"Instructions" bundle:nil];
	[UIView setAnimationDuration:.75]; 
	
	self.instructionsScreen.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
	[self presentModalViewController:self.instructionsScreen animated:YES];
	
}

-(IBAction) switchToSettingsScreen
{
	settingsScreen = [[Settings alloc] initWithNibName:@"Settings" bundle:nil];
	[UIView setAnimationDuration:.75]; 
	DemonsAppDelegate *appDelegate = (DemonsAppDelegate *)[[UIApplication sharedApplication] delegate]; 
	settingsScreen.activeDemons = appDelegate.activeDemons;
	//settingsScreen.activeDemons = activeDemons;
	self.settingsScreen.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
	[self presentModalViewController:self.settingsScreen animated:YES];
	
}


-(IBAction) test
{
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	NSInteger demonNum = [prefs integerForKey:@"demonNumKey"];
	testLabel.text = [NSString stringWithFormat:@"%i", demonNum];	
}





// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {

    [super viewDidLoad];
}




- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
