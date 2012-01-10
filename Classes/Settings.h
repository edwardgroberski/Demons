//
//  Settings.h
//  Demons
//
//  Created by Eddie Groberski on 11/20/11.
//  Copyright 2011 Eddie Groberski. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Settings : UIViewController {
	IBOutlet UISegmentedControl *segment;
	UILabel *testLabel;
	NSNumber *activeDemons;

}
@property (nonatomic, retain) IBOutlet NSNumber *activeDemons;
@property (nonatomic, retain) IBOutlet UISegmentedControl *segment;
@property (nonatomic, retain) IBOutlet UILabel *testLabel;

-(IBAction) backToMainMenu:(id) sender;
-(IBAction) changeSeg;
@end
