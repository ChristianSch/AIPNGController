# AIPNGController
AIPNGController provides an easy and extensible way to generate a png image with support for drawing black lines on a transparent background.

The canvas is represented by a [`bitmap graphics context`](https://developer.apple.com/library/mac/documentation/GraphicsImaging/Conceptual/drawingwithquartz2d/dq_context/dq_context.html#//apple_ref/doc/uid/TP30001066-CH203-CJBHBFFE) and the drawings utilize the path creation methods from `CGContext`. For more information have a look at the [Quartz 2D Programming Guide](https://developer.apple.com/library/mac/documentation/GraphicsImaging/Conceptual/drawingwithquartz2d/Introduction/Introduction.html#//apple_ref/doc/uid/TP30001066) in the Apple Developer Library.

# Dependencies
AIPNGController depends on the Cocoa framework.

# Example
An example of usage can be found in main.m

## Compilation of the example

	gcc -framework Cocoa -x objective-c -o AIPNG AIPNGController.m main.m && ./AIPNG

# Usage
Just drag the AIPNGController.h and AIPNGController.m files in to your XCode-Project or alike, and import the header. Initiate the controller and context according to the example.

# Extension
You can subclass or change the controller itself for providing new methods i.e. for new image formats, colors, or fillings.
