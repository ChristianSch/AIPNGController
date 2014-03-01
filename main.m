//
//  main.m
//  AIPNGController
//
//  Created by Christian Schulze on 01.03.14.
//  Copyright (c) 2014 Christian Schulze, andinfinity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AIPNGController.h"

int main(int argc, const char * argv[])
{
	@autoreleasepool {
		CGFloat width = 300;
		CGFloat height = 400;
		
		AIPNGController *pngController = [[AIPNGController alloc] init];
		[pngController createBitmapContextWithWidth:width andHeight:height];
		
		// 1
		[pngController drawLineFrom:CGPointMake(10, 10)
								 to:CGPointMake(width - 10, 10)];
		// 2
		[pngController drawLineFrom:CGPointMake(width - 10, 10)
								 to:CGPointMake(width - 10, height * 2 / 3)];
		// 3
		[pngController drawLineFrom:CGPointMake(width - 10, height * 2 / 3)
								 to:CGPointMake(10, height * 2 / 3)];
		// 4
		[pngController drawLineFrom:CGPointMake(10, height * 2 / 3)
								 to:CGPointMake(width / 2, height - 10)];
		// 5
		[pngController drawLineFrom:CGPointMake(width / 2, height - 10)
								 to:CGPointMake(width - 10, height * 2 / 3)];
		// 6
		[pngController drawLineFrom:CGPointMake(width - 10, height * 2 / 3)
								 to:CGPointMake(10, 10)];
		// 7
		[pngController drawLineFrom:CGPointMake(10, 10)
								 to:CGPointMake(10, height * 2 / 3)];
		// 8
		[pngController drawLineFrom:CGPointMake(10, height * 2 / 3)
								 to:CGPointMake(width - 10, 10)];
		
		[pngController
		 saveImageToPNGWithPath:@"/Users/x/Desktop/Das-Ist-Das-Haus-Vom-Ni-ko-laus.png"];
	}
	
    return 0;
}