//
//  Settings.m
//  Demons
//
//  Created by Eddie Groberski on 11/20/11.
//  Copyright 2011 Eddie Groberski. All rights reserved.
//

#import "Settings.h"



@implementation Settings
@synthesize segment;
@synthesize testLabel;
@synthesize activeDemons;


-(IBAction) backToMainMenu:(id) sender
{
	[self dismissModalViewControllerAnimated:YES];
}

-(IBAction)changeSeg{
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];

	if(segment.selectedSegmentIndex == 0){
		[prefs setInteger:5 forKey:@"demonNumKey"];
		testLabel.text = [NSString stringWithFormat:@"%i", 5];	

	}
	if(segment.selectedSegmentIndex == 1){
		[prefs setInteger:6 forKey:@"demonNumKey"];
		testLabel.text = [NSString stringWithFormat:@"%i", 6];	
	}
	if(segment.selectedSegmentIndex == 2){
		[prefs setInteger:7 forKey:@"demonNumKey"];
		testLabel.text = [NSString stringWithFormat:@"%i", 7];	
	}
	if(segment.selectedSegmentIndex == 3){
		[prefs setInteger:8 forKey:@"demonNumKey"];
		testLabel.text = [NSString stringWithFormat:@"%i", 8];	
	}
	if(segment.selectedSegmentIndex == 4){
		[prefs setInteger:10 forKey:@"demonNumKey"];
		testLabel.text = [NSString stringWithFormat:@"%i", 9];	
	}
	
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	NSInteger demonNum = [prefs integerForKey:@"demonNumKey"];
	if (demonNum == 5){
		segment.selectedSegmentIndex = 0;
	}
	if (demonNum == 6){
		segment.selectedSegmentIndex = 1;
	}
	if (demonNum == 7){
		segment.selectedSegmentIndex = 2;
	}
	if (demonNum == 8){
		segment.selectedSegmentIndex = 3;
	}
	if (demonNum == 9){
		segment.selectedSegmentIndex = 4;
	}
	
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
