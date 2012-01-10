//
//  DemonsViewController.m
//  Demons
//
//  Created by Eddie Groberski on 11/14/11.
//  Copyright Eddie Groberski. All rights reserved.
//
#import "MenuScreen.h"
#import "DemonsViewController.h"
#import "DemonsAppDelegate.h"

@implementation DemonsViewController
@synthesize mainMenu;
@synthesize activeDemons;


-(IBAction) switchToMainMenu: (id) sender
{
	
	MenuScreen *main = [[MenuScreen alloc] initWithNibName:@"MenuScreen" bundle:nil];
	self.mainMenu = main;
	
	/*
	DemonsAppDelegate *appDelegate = (DemonsAppDelegate *)[[UIApplication sharedApplication] delegate]; 
	main.activeDemons = appDelegate.activeDemons;
	//main.activeDemons = activeDemons;
	 */
	
	//	[self.view insertSubview:main.view atIndex:0];
	
	[main release];	
	
	
	[UIView setAnimationDuration:.75]; 
	
	self.mainMenu.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	
	[self presentModalViewController:self.mainMenu animated:YES];
}



-(void) switchToMain
{
	
	MenuScreen *main = [[MenuScreen alloc] initWithNibName:@"MenuScreen" bundle:nil];
	self.mainMenu = main;
	
	/*
	 DemonsAppDelegate *appDelegate = (DemonsAppDelegate *)[[UIApplication sharedApplication] delegate]; 
	 main.activeDemons = appDelegate.activeDemons;
	 //main.activeDemons = activeDemons;
	 */
	
	//	[self.view insertSubview:main.view atIndex:0];
	
	[main release];	
	
	
	[UIView setAnimationDuration:.75]; 
	
	self.mainMenu.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	
	[self presentModalViewController:self.mainMenu animated:YES];
}


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	UIImage *background = [UIImage imageNamed: @"splash.png"];    
	UIImageView *imageView = [[UIImageView alloc] initWithImage: background]; 
	
	[self.view addSubview: imageView]; 
	
	[imageView release];
	
    [super viewDidLoad];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
