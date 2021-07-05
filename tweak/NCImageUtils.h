#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
@interface NCImageUtils : NSObject
+ (UIColor *)averageColor:(UIImage *)image;
+ (NSDictionary*)dominantColors:(UIImage *)image detail:(int)detail; //https://stackoverflow.com/questions/13694618/objective-c-getting-least-used-and-most-used-color-in-a-image for everything on this page
@end