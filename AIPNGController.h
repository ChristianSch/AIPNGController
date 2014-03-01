//
//  AIPNGController.h
//  AIPNGController
//
//  Created by Christian Schulze on 01.03.14.
//  Copyright (c) 2014 Christian Schulze, andinfinity. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @header AIPNGController
 This controller provides basic drawing to a canvas and saving the image to a png.
 @author Christian Schulze
 @copyright Christian Schulze, andinfinity
 @version 0.1
 @updated 01.03.14
 @discussion This controller can easily be extended to provide saving to other formats as well. See: https://developer.apple.com/library/mac/documentation/GraphicsImaging/Conceptual/drawingwithquartz2d/Introduction/Introduction.html#//apple_ref/doc/uid/TP30001066
 */
@interface AIPNGController : NSObject {
	int viewHeight;
	int viewWidth;
	
	CGContextRef context;
}

#pragma mark - initiating the canvas
/*!
 Initiate context that represents the `canvas`.
 
 @param width of the context
 @param height of the context
 
 @discussion the context represents the `canvas` to draw on
 */
- (void) createBitmapContextWithWidth:(int)width andHeight:(int)height;

#pragma mark - drawing

/*!
 Draw line on canvas starting from `start` and ending at `end`.
 
 @param start of line
 @param end of line
 */
- (void) drawLineFrom:(CGPoint)start to:(CGPoint)end;

# pragma mark - saving the image to png

/*!
 Save the image to a png at given path.
 
 @param path of the png including the filename
 */

- (void) saveImageToPNGWithPath:(NSString *)path;

@end
