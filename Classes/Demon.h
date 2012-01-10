//
//  Demon.h
//  Demons
//
//  Created by Eddie Groberski on 11/14/11.
//  Copyright Eddie Groberski. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Demon : NSObject {
	CGFloat  x;
	CGFloat	 y;
	CGFloat	 height;
	CGFloat	 width;
	CGFloat  r;
	CGFloat	 g;
	CGFloat	 b;
	CGFloat  a; 

}

@property (assign)CGFloat  x;
@property (assign)CGFloat  y;
@property (assign)CGFloat  height;
@property (assign)CGFloat  width;
@property (assign)CGFloat  r;
@property (assign)CGFloat  g;
@property (assign)CGFloat  b;
@property (assign)CGFloat  a; 

@end
