//
//  AIPNGController.m
//  AIPNGController
//
//  Created by Christian Schulze on 01.03.14.
//  Copyright (c) 2014 Christian Schulze, andinfinity. All rights reserved.
//

#import "AIPNGController.h"

@implementation AIPNGController

#pragma mark - initiating the canvas

- (void) createBitmapContextWithWidth:(int)width andHeight:(int)height
{
	self->viewWidth = width;
	self->viewHeight = height;
	
	// Nach Dokumentation den CGContext initialisieren
    int bitmapBytesPerRow = (width * 4);
    int bitmapByteCount = (bitmapBytesPerRow * height);
	
    CGColorSpaceRef colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
	void *bitmapData = malloc(bitmapByteCount);
	
    if (bitmapData == NULL)
    {
		NSLog(@"Memory not allocated!");
		return;
    }
	
	CGContextRef contextRef = CGBitmapContextCreate(bitmapData,
													width,
													height,
													8,
													bitmapBytesPerRow,
													colorSpace,
													(CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
	
    if (contextRef == NULL)
    {
        free(bitmapData);
        NSLog(@"Context could not be created!");
        return;
    }
	
    CGColorSpaceRelease( colorSpace );
	self->context = contextRef;
}

#pragma mark - drawing

- (void) drawLineFrom:(CGPoint)start to:(CGPoint)end
{
	if (self->context != NULL) {
		// check for negative coordinates:
		if (start.x < 0 || start.x > self->viewWidth)
		{
			NSLog(@"Coordinates from start.x out of view: %f. Not drawing!", start.x);
			return;
			
		} else if(start.y < 0 || start.y > self->viewHeight)
		{
			NSLog(@"Coordinates from start.y out of view: %f. Not drawing!", start.y);
			return;
			
		} else if(end.x < 0 || end.x > self->viewWidth)
		{
			NSLog(@"Coordinates from end.x out of view: %f. Not drawing!", end.x);
			return;
			
		} else if(end.y < 0 || end.y > self->viewHeight)
		{
			NSLog(@"Coordinates from end.y out of view: %f. Not drawing!", end.y);
			return;
		}
		
		// Quartz den Beginn eines neuen Pfades (unserer Linie) signalisieren
		CGContextBeginPath(self->context);
		
		// Linienanfang setzen
		CGContextMoveToPoint(self->context, start.x, start.y);
		// Linienende setzen
		CGContextAddLineToPoint(self->context, end.x, end.y);
		
		// Fertig mit der Pfaderstellung! Nun soll die Linie auch gezeichnet werden.
		CGContextStrokePath(self->context);
		
	} else {
		NSLog(@"No context created!");
	}
}

# pragma mark - saving the image to png

- (void) saveImageToPNGWithPath:(NSString *)path
{
	CFURLRef url = (__bridge CFURLRef)[NSURL fileURLWithPath:path];
	CGImageDestinationRef destination = CGImageDestinationCreateWithURL(url,
																		kUTTypePNG,
																		1,
																		NULL);
	CGImageDestinationAddImage(destination,
							   CGBitmapContextCreateImage(self->context),
							   nil);
	
	if (!CGImageDestinationFinalize(destination))
	{
        NSLog(@"Failed to write image to %@", path);
		
    } else {
		CGContextRelease(self->context);
		self->context = NULL;
	}
}
@end